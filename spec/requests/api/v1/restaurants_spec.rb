require 'rails_helper'

RSpec.describe 'return all restaurants' do 
  it '/restaurants' do 

    arbys = Restaurant.create!(name: "Arbys", description: "We have the meat!", logo: "arbys.com")
    noodles = Restaurant.create!(name: "Noodles and Company", description: "Noodles from around the world", logo: "noodles.com")
    subway = Restaurant.create!(name: "Subway", description: "Sandwiches", logo: "subway.com")

    
    
    get "/api/v1/restaurants"
    expect(response).to be_successful 

    restaurants = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(restaurants.count).to eq(3)

    expect(restaurants[0]).to have_key(:id)
    expect(restaurants[0][:id]).to be_a String

    expect(restaurants[0]).to have_key(:type)
    expect(restaurants[0][:type]).to eq("restaurant")

    expect(restaurants[0][:attributes]).to have_key(:name)
    expect(restaurants[0][:attributes][:name]).to be_a String 

    expect(restaurants[0][:attributes]).to have_key(:description)
    expect(restaurants[0][:attributes][:description]).to be_a String 


    expect(restaurants[0][:attributes]).to have_key(:logo)
    expect(restaurants[0][:attributes][:logo]).to be_a String 


  end

  it 'can create a new restaurant' do 
    arbys = Restaurant.create!(name: "Arbys", description: "We have the meat!", logo: "arbys.com")

    restaurant = {
      "name": "Pizza Hut", 
      "description": "A pizza place with mediocre pizza", 
      "logo": "pizzahut.com"
    }
    post "/api/v1/restaurants", headers: {'CONTENT_TYPE' => 'application/json'}, params: JSON.generate(restaurant)
    expect(response).to be_successful 

    last_restaurant = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(last_restaurant.include?(arbys)).to eq(false)
    expect(last_restaurant[:attributes][:name]).to eq("Pizza Hut")
    expect(last_restaurant[:attributes][:description]).to eq("A pizza place with mediocre pizza")
    expect(last_restaurant[:attributes][:logo]).to eq("pizzahut.com")

  end
end