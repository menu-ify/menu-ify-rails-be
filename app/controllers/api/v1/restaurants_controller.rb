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

  private 
  def restaurant_params
    params.permit(:name, :description, :logo)
  end
end