class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :status
      t.boolean :maintenance
      t.timestamps null: false
    end
  end
end
