class RemoveColumnFromAdminSettings < ActiveRecord::Migration
  def change
	remove_column :admin_settings, :tab_6_columns
  end
end
