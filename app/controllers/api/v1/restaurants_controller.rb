class Api::V1::RestaurantsController < ApplicationController 
  def index 
    render json: RestaurantSerializer.new(Restaurant.all) 
  end

  def create 
    render json: RestaurantSerializer.new(Restaurant.create(restaurant_params)), status: 200
  end

  private 
  def restaurant_params
    params.permit(:name, :description, :logo)
  end
end