class AddCategoryIdToActivities < ActiveRecord::Migration
  def change
    change_table :activities do |table|
      table.references :category
    end
  end
end
