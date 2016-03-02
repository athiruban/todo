class SetLimitForPriorityInActivities < ActiveRecord::Migration
  def change
    change_column :activities, :priority, :integer, :limit => 1
  end
end
