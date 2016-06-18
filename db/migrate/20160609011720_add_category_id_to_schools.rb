class AddCategoryIdToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :category_id, :integer
  end
end
