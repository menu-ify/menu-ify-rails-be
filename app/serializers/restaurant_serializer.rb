class RestaurantSerializer 
  include JSONAPI::Serializer 
  attributes :name, :description, :logo 
end