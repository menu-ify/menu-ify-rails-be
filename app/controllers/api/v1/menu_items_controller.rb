class Api::V1::MenuItemsController < ApplicationController
  before_action :find_restaurant

  def index
    render json: MenuItemSerializer.new(@restaurant.menu_items)
  end

  def create
    menu_item = MenuItem.create(menu_item_params)
    if menu_item.save
      render json: MenuItemSerializer.new(menu_item), status: :created
    else
      render json: { error: "One or more attributes is missing" }, status: :bad_request
    end
  end

  def update
    if !params[:name].present? || !params[:description].present? || !params[:category].present? || !params[:price].present? || !params[:tags].present?
      render json: { error: "One or more attributes is missing" }
    else
      render json: MenuItemSerializer.new(MenuItem.update(params[:id], menu_item_params)), status: 200
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def menu_item_params
    params.permit(:name, :description, :tags, :category, :image, :price)
  end
end