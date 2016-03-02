class RenamePositionToPriorityInActivities < ActiveRecord::Migration
  def change
    rename_column :activities, :position, :priority
  end
end
