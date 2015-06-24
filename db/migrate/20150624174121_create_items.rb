class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.decimal :price, precision: 6, scale: 2, null: false
      t.text :contact, null: false
      t.string :city
      t.string :quality
      t.string :name_of_item, null: false
      t.text :description
      t.timestamps null: false
    end
  end
end
