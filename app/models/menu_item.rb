class MenuItem < ApplicationRecord
  belongs_to :restaurant
  validates_uniqueness_of :name 
  validates_presence_of :name, :description, :tags, :category, :image, :price
end
