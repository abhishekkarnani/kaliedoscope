class AddColumnToAdminSettings < ActiveRecord::Migration
  def up
	add_column :admin_settings, :tab, :integer
	add_column :admin_settings, :column, :integer
  end
  def down
	remove_column :admin_settings, :tab
	remove_column :admin_settings, :column
  end
end
