class AddFieldsToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :category_name, :string, :limit => 140
  end
end
