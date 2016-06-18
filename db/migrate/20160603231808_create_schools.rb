class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.text :description
      t.text :features
      t.string :address
      t.integer :city_id
      t.integer :state_id
      t.string :zipcode
      t.float :lat
      t.float :lng
      t.string :email
      #t.boolean  :hidden_gem            :default => false
    #t.boolean  :special_admissions    :default => false
      t.string :phone
      t.string :fax
      t.integer :students_count
      t.string :website
      #t.integer :bpsid
      t.integer :org_code
      t.integer :teachers_count
      t.string :short_name
      t.integer :assignment_zone_id
      t.integer :neighborhood_id
     t.string :early_dismissal_time
      t.string :staff_to_student_ratio
      t.integer :principal_id
      t.integer :parcel_id
      t.string :category_id

      t.timestamps null: false
    end
    #add_index :schools, :assignment_zone_id
   # add_index :schools, :school_type_id
    #add_index :schools, :neighborhood_id
    #add_index :schools, :parcel_id
   # add_index :schools, :principal_id
  #end

  create_table :school_grades do |t|
      t.integer :school_id
      t.integer :grade_level_id
      t.string :grade_number
      t.string :hours
      t.integer :open_seats
      t.integer :first_choice
      t.integer :second_choice
      t.integer :third_choice
      t.integer :fourth_higher_choice
      t.integer :mcas_reading
      t.integer :mcas_math
      t.timestamps null: false
    end
    add_index :school_grades, :school_id
    add_index :school_grades, :grade_level_id
  end
end
