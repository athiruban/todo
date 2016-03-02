class ChangeActivityStatusType < ActiveRecord::Migration
  def change
    change_column :activities, :status, :integer, :limit => 1
  end
end
