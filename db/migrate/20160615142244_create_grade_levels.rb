class CreateGradeLevels < ActiveRecord::Migration
  def change
    create_table :grade_levels do |t|

    	 t.string :name
      t.float :walk_zone_radius
      t.timestamps
    end
    
    create_table :grade_levels_schools, :id => false do |t|
      t.integer  :school_id
    t.integer  :grade_level_id
    t.string   :grade_number
    t.string   :hours
    t.integer  :open_seats
    t.integer  :first_choice
    t.integer  :second_choice
    t.integer  :third_choice
    t.integer  :fourth_higher_choice
    t.datetime :created_at
    t.datetime :updated_at
    t.integer  :mcas_ela_total
    t.float    :mcas_ela_advanced
    t.float    :mcas_ela_proficient
    t.float    :mcas_ela_needsimprovement
    t.float    :mcas_ela_failing
    t.integer  :mcas_math_total
    t.float    :mcas_math_advanced
    t.float    :mcas_math_proficient
    t.float    :mcas_math_needsimprovement
    t.float    :mcas_math_failing
    t.integer  :mcas_science_total
    t.float    :mcas_science_advanced
    t.float    :mcas_science_proficient
    t.float    :mcas_science_needsimprovement
    t.float    :mcas_science_failing
    t.text     :uniform_policy

      t.timestamps null: false
    end
  end
end
