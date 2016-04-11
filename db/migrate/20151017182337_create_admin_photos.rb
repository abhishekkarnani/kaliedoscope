class CreateAdminPhotos < ActiveRecord::Migration
  def change
    create_table :admin_photos do |t|
      t.attachment :logo
      t.string :type
      t.timestamps null: false
    end
  end
end
