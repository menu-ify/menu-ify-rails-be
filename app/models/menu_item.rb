class MenuItem < ApplicationRecord
  belongs_to :restaurant
  validates_presence_of :name, :description, :tags, :category, :image, :price
  validates :price, numericality: true
end
