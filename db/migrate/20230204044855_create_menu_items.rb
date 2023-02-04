class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.belongs_to :restaurant, foreign_key: true
      t.string :name
      t.string :description
      t.string :allergens
      t.string :category
      t.string :image
      t.string :price

      t.timestamps
    end
  end
end
