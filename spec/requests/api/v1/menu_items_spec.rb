require 'rails_helper'

describe 'The MenuItems API' do
  it 'can get all menu items for a restaurant' do
    restaurant1 = Restaurant.create!(name: "Arby's", description: "We have the meats!", logo: "arbys.com")
    restaurant2 = Restaurant.create!(name: "Noodles and Company", description: "Noodles from around the world", logo: "noodles.com")
    create_list(:menu_item, 5, restaurant: restaurant1)
    create_list(:menu_item, 10, restaurant: restaurant2)

    get "/api/v1/restaurants/#{restaurant1.id}/menu_items"

    expect(response).to be_successful 
    menu_items = JSON.parse(response.body,symbolize_names: true)

    expect(menu_items).to be_a(Hash)
    expect(menu_items).to have_key(:data)
    expect(menu_items[:data]).to be_an(Array)
    expect(menu_items[:data].size).to eq(5)

    menu_items[:data].each do |menu_item|

      expect(menu_item).to have_key(:id)
      expect(menu_item[:id]).to be_a String

      expect(menu_item).to have_key(:type)
      expect(menu_item[:type]).to eq("menu_item")

      expect(menu_item[:attributes]).to have_key(:name)
      expect(menu_item[:attributes][:name]).to be_a String 

      expect(menu_item[:attributes]).to have_key(:restaurant_id)
      expect(menu_item[:attributes][:restaurant_id]).to be_a Integer
      expect(menu_item[:attributes][:restaurant_id]).to eq(restaurant1.id)

      expect(menu_item[:attributes]).to have_key(:description)
      expect(menu_item[:attributes][:description]).to be_a String 
      
      expect(menu_item[:attributes]).to have_key(:tags)
      expect(menu_item[:attributes][:tags]).to be_a String 

      expect(menu_item[:attributes]).to have_key(:category)
      expect(menu_item[:attributes][:category]).to be_a String 

      expect(menu_item[:attributes]).to have_key(:image)
      expect(menu_item[:attributes][:image]).to be_a String 

      expect(menu_item[:attributes]).to have_key(:price)
      expect(menu_item[:attributes][:price]).to be_a Float
    end
  end

  it 'can create a menu item for a restaurant' do
    restaurant = create(:restaurant, name: "Los Pollos Hermanos")
    menu_item_params = { 
                            restaurant_id: "#{restaurant.id}",
                            name: "Spice Curls",
                            description: "The curly fry with a southwestern kick!",
                            tags: "vegetarian, vegan",
                            category: "Sides",
                            image: "https://www.lospolloshermanos.com/spice_curls.jpeg",
                            price: 4.95
                       }
    headers = {
                  'Content-Type' => 'application/json',
                  'Accept' => 'application/json'        
              }
    
    expect(MenuItem.all.count).to eq(0)
     
    post "/api/v1/restaurants/#{restaurant.id}/menu_items", headers: headers, params: JSON.generate(menu_item_params)

    expect(MenuItem.all.count).to eq(1)
    
    new_menu_item = MenuItem.last
    response_data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    expect(new_menu_item.restaurant_id).to eq(restaurant.id.to_s)
    expect(new_menu_item.name).to eq(menu_item_params[:name])
    expect(new_menu_item.description).to eq(menu_item_params[:description])
    expect(new_menu_item.tags).to eq(menu_item_params[:tags])
    expect(new_menu_item.category).to eq(menu_item_params[:category])
    expect(new_menu_item.image).to eq(menu_item_params[:image])
    expect(new_menu_item.price).to eq(menu_item_params[:price])
  end
end