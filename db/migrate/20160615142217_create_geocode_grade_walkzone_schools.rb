class CreateGeocodeGradeWalkzoneSchools < ActiveRecord::Migration
  def change
    create_table :geocode_grade_walkzone_schools do |t|

      t.timestamps null: false
    end
  end
end
