class CreateAdminSettings < ActiveRecord::Migration
  def change
    create_table :admin_settings do |t|
      t.integer :tabs
      t.integer :tab_1_columns
      t.integer :tab_2_columns
      t.integer :tab_3_columns
      t.integer :tab_4_columns
      t.integer :tab_5_columns
      t.integer :tab_6_columns
      t.timestamps null: false
    end
  end
end
