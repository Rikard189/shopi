class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :photo, null: true
      t.boolean :purchased, default: false
      t.string :category, default: "General" 

      t.timestamps
    end
  end
end
