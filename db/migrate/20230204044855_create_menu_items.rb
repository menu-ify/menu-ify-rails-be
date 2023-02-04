class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.belongs_to :restaurant, foreign_key: true
      t.string :name
      t.string :description
      t.string :tags
      t.string :category
      t.string :image
      t.float :price

      t.timestamps
    end
  end
end
