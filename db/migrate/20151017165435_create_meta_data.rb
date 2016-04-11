class CreateMetaData < ActiveRecord::Migration
  def change
    create_table :meta_data do |t|
      t.string :heading
      t.string :title
      t.string :description
      t.timestamps null: false
    end
  end
end
