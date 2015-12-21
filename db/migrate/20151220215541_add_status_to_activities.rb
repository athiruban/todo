class AddStatusToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :status, :string, :limit => 255
  end
end
