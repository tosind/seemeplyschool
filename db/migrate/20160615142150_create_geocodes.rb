class CreateGeocodes < ActiveRecord::Migration
  def change
    create_table :geocodes do |t|

     t.references :assignment_zone
    end
    create_table :address_ranges do |t|
      t.references :geocode
      t.integer :num_start
      t.integer :num_end
      t.boolean :is_even
      t.string  :street
      t.string  :zipcode
      t.integer :geocode_id
      t.timestamps null: false
    end
    create_table :geocode_grade_walkzone_schools do |t|
      t.boolean :transportation_eligible
      t.references :geocode
      t.references :grade_level
      t.references :school
      t.timestamps null: false
    end

  # def down
  #   drop_table :geocodes
  #   drop_table :address_ranges
  #   drop_table :geocode_grade_walkzone_schools
  # end

      
  end
end

