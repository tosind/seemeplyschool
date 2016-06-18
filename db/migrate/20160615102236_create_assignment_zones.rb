class CreateAssignmentZones < ActiveRecord::Migration
  def change
    create_table :assignment_zones do |t|
      t.string :name
      t.float :coordinates

      t.timestamps null: false
    end
  end
end