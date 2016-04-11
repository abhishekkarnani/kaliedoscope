class AddColumnToMetaData < ActiveRecord::Migration
  def self.up
	add_column :meta_data, :image_count, :integer
  end
  def self.down
	remove_column :meta_data, :image_count
  end
end
