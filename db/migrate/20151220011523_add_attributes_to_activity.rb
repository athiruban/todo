class AddAttributesToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :content, :text, :limit => 2048
  end
end
