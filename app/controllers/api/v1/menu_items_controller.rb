class Api::V1::MenuItemsController < ApplicationController
  before_action :find_restaurant

  def index
    render json: MenuItemSerializer.new(@restaurant.menu_items)
  end

  private

    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
end