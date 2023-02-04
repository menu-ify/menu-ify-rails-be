class Api::V1::RestaurantsController < ApplicationController 
  def index 
    render json: RestaurantSerializer.new(Restaurant.all) 
  end
end