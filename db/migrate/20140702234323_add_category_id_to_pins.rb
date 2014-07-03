class AddCategoryIdToPins < ActiveRecord::Migration
  def change
    add_column :pins, :category_id, :integer
    add_index :pins, :category_id
  end
end
