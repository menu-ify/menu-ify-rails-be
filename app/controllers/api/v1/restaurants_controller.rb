class Api::V1::RestaurantsController < ApplicationController 
  def index 
    render json: RestaurantSerializer.new(Restaurant.all) 
  end

  def create 
    render json: RestaurantSerializer.new(Restaurant.create(restaurant_params)), status: 200
  end

  def update
    if !params[:restaurant][:name].present? || !params[:restaurant][:description].present? || !params[:restaurant][:logo].present?
      render json: { error: "One or more attributes is missing" }
    else
      render json: RestaurantSerializer.new(Restaurant.update(params[:id], restaurant_params)), status: 200
    end
  end

  def destroy 
    if Restaurant.find_by_id(params[:id]) == nil
      render json: { error: "No restaurant exists with that Id"}
    else
      restaurant = Restaurant.find(params[:id])
      restaurant.destroy
      render json: { success: "Restaurant has been successfully deleted"}
    end
  end

  private 
  def restaurant_params
    params.permit(:name, :description, :logo)
  end
end