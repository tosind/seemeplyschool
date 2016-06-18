class CreateAddressRanges < ActiveRecord::Migration
  def change
    create_table :address_ranges do |t|

    t.integer :geocode_id
    t.integer :num_start
    t.integer :num_end
    t.boolean :is_even
    t.string  :street
    t.string  :zipcode

      t.timestamps null: false
    end
  end
end
