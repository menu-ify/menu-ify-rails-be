class Restaurant < ApplicationRecord
  has_many :menu_items 
  validates_uniqueness_of :name 
  validates_presence_of :name, :description, :logo 
end
