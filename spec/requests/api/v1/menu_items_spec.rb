require 'rails_helper'

describe 'The MenuItems API' do
  it "can get all menu items for a restaurant" do
    restaurant1 = Restaurant.create!(name: "Arby's", description: "We have the meats!", logo: "arbys.com")
    restaurant2 = Restaurant.create!(name: "Noodles and Company", description: "Noodles from around the world", logo: "noodles.com")
    create_list(:menu_item, 5, restaurant: restaurant1)
    create_list(:menu_item, 10, restaurant: restaurant2)
    require 'pry'; binding.pry
    get "/api/v1/restaurants/#{restaurant1.id}/menu_items"

    expect(response).to be_successful 
    menu_items = JSON.parse(response.body,symbolize_names: true)

    expect(menu_items).to be_a(Hash)
    expect(menu_items).to have_key(:data)
    expect(menu_items[:data]).to be_an(Array)
    expect(menu_items[:data].size).to eq(5)

    expect(menu_items[0]).to have_key(:id)
    expect(menu_items[0][:id]).to be_a String

    expect(menu_items[0]).to have_key(:type)
    expect(menu_items[0][:type]).to eq("menu_item")

    expect(menu_items[0][:attributes]).to have_key(:name)
    expect(menu_items[0][:attributes][:name]).to be_a String 

    expect(menu_items[0][:attributes]).to have_key(:description)
    expect(menu_items[0][:attributes][:description]).to be_a String 
    
    expect(menu_items[0][:attributes]).to have_key(:tags)
    expect(menu_items[0][:attributes][:name]).to be_a String 

    expect(menu_items[0][:attributes]).to have_key(:category)
    expect(menu_items[0][:attributes][:description]).to be_a String 

    expect(menu_items[0][:attributes]).to have_key(:image)
    expect(menu_items[0][:attributes][:description]).to be_a String 

    expect(menu_items[0][:attributes]).to have_key(:price)
    expect(menu_items[0][:attributes][:logo]).to be_a Float 
  end
end