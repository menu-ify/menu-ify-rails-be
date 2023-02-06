class MenuItemSerializer 
  include JSONAPI::Serializer

  attributes :restaurant_id, :name, :description, :tags, :category, :image, :price
end