class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.attachment :photo
      t.references :meta_datum
      t.timestamps null: false
    end
  end
end
