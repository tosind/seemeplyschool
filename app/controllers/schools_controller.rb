class SchoolsController < ApplicationController
before_action :authenticate_user!
before_action :set_school, only: [:show, :edit, :update, :destroy]


# GET /schools
# GET /schools.json

def dashboard

end

def index
     set_session_variables
    
    m, @street_number, @street_name = session[:address].try(:match, (/(\d+)\s+(.*)/)).try(:to_a)
    
    if session[:address].blank?
      redirect_to(root_url, alert: "You must enter an address")
    elsif session[:zipcode].blank?
      redirect_to(root_url, alert: "You must enter a zipcode")
    elsif m.blank?
      redirect_to(root_url, alert: "We couldn't locate that address - please try again")
    else
      @address_ranges = AddressRange.find_all_by_search_params(@street_number.to_i, @street_name, session[:zipcode])    
      if @address_ranges.blank?
        redirect_to(root_url, alert: "We couldn't locate that address - please try again.")
      else
        if @address_ranges.size == 1
          shared_variables
          respond_to do |format|
            format.html
            format.js
            format.pdf do
              pdf = SchoolsPdf.new(@all_schools, @grade_levels, @grade_level, @geocoded_address, view_context, session)
              send_data pdf.render, filename: "schools.pdf", type: "application/pdf", disposition: "inline"
            end
          end
        elsif @address_ranges.size > 1
          render 'pages/home'
        end    
      end
    end
  end
  # @schools = School.all
  # if params[:search]
  # @posts = School.search(params[:search]).order("created_at DESC")
  # else
  # @posts = School.all.order('created_at DESC')
  # end

# GET /schools/1
# GET /schools/1.json
def show
  set_session_variables
    m, @street_number, @street_name = session[:address].try(:match, (/(\d+)\s+(.*)/)).try(:to_a)
    @address_ranges = AddressRange.find_all_by_search_params(@street_number.to_i, @street_name, session[:zipcode])
    shared_variables
    @school = @all_schools.find {|x| x.permalink == params[:id] }

    if @school.eligibility =~ /Walk Zone/
      @map_flag_color = '53e200'
    elsif @school.eligibility =~ /Assignment Zone/
      @map_flag_color = 'fcef08'
    else
      @map_flag_color = 'c8c8c8'
    end

    respond_to do |format|
      format.html
      format.json { render json: @school }
      format.pdf do
        pdf = SchoolPdf.new(@school, @grade_level, view_context, session)
        send_data pdf.render, filename: "#{@school.permalink}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
end

def compare
    if session[:address].blank?
      redirect_to(root_url, alert: "You must enter an address")
    elsif session[:zipcode].blank?
      redirect_to(root_url, alert: "You must enter a zipcode")
    else
      @favorite_schools = session[:favorites].map {|x| School.find(x)}
      respond_to do |format|
        format.html
        format.js
      end
    end
end

  ####### AJAX #######
  
  def switch_tab
    respond_to do |format|
      format.js
    end
  end
  
  def favorite
    @school = School.find(params[:id])
    session[:favorites] ||= []
    session[:favorites] << @school.id unless session[:favorites].include?(@school.id)
    session[:favorites].present? ? @favorite_schools = session[:favorites].map {|x| School.find(x)} : @favorite_schools = []
    respond_to do |format|
      format.js
    end
  end
  
  def unfavorite
    @school = School.find(params[:id])
    session[:favorites].delete_if {|x| x == @school.id }
    session[:favorites].present? ? @favorite_schools = session[:favorites].map {|x| School.find(x)} : @favorite_schools = []
    respond_to do |format|
      format.js
    end
  end
  
  def sort
    @favorite_schools = params[:school].map {|x| School.find(x)}
    session[:favorites] = []
    @favorite_schools.each do |school|
      session[:favorites] << school.id
    end
    render :nothing => true
  end
  
private
  
  def set_session_variables
    session[:address]         = params[:address]
    session[:zipcode]         = params[:zipcode]
    session[:grade_level]     = params[:grade_level]
    session[:sibling_school]  = params[:sibling_school]
  end
  
  def shared_variables
    @address = @address_ranges.first
    @grade_levels = GradeLevel.all
    @grade_level = GradeLevel.find_by_number(session[:grade_level])
    @geocoded_address ||= geocode_address("#{@street_number} #{@street_name}, #{session[:zipcode]}")
    @geocode = @address.geocode
    @assignment_zone = @geocode.assignment_zone
    @walk_zone_schools = School.walkzone_schools(@geocode, @grade_level, @geocoded_address)
    @assignment_zone_schools = @grade_level.assignment_zone_schools(@geocoded_address, @assignment_zone) - @walk_zone_schools
    @citywide_schools = @grade_level.citywide_schools(@geocoded_address, AssignmentZone.citywide) - @walk_zone_schools
    @all_schools = (@walk_zone_schools + @assignment_zone_schools + @citywide_schools)
    session[:favorites].present? ? @favorite_schools = session[:favorites].map {|x| School.find(x)} : @favorite_schools = []
  end

# GET /schools/new
def new
  @school = School.new
end

# GET /schools/1/edit
def edit
end

# POST /schools
# POST /schools.json
def create
  @school = School.new(school_params)

  respond_to do |format|
    if @school.save
      format.html { redirect_to @school, notice: 'School was successfully created.' }
      format.json { render :show, status: :created, location: @school }
    else
      format.html { render :new }
      format.json { render json: @school.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /schools/1
# PATCH/PUT /schools/1.json
def update
  respond_to do |format|
    if @school.update(school_params)
      format.html { redirect_to @school, notice: 'School was successfully updated.' }
      format.json { render :show, status: :ok, location: @school }
    else
      format.html { render :edit }
      format.json { render json: @school.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /schools/1
# DELETE /schools/1.json
def destroy
  @school.destroy
  respond_to do |format|
    format.html { redirect_to schools_url, notice: 'School was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_school
    @school = School.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def school_params
    params.require(:school).permit(:schoolname, :description, :address, :contactinfo)
  end
end
