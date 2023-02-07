require 'rails_helper'

describe 'The MenuItems API' do
  describe 'GET menu items' do
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
  end

  describe 'POST menu items' do
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

      expect(new_menu_item.restaurant_id).to eq(restaurant.id)
      expect(new_menu_item.name).to eq(menu_item_params[:name])
      expect(new_menu_item.description).to eq(menu_item_params[:description])
      expect(new_menu_item.tags).to eq(menu_item_params[:tags])
      expect(new_menu_item.category).to eq(menu_item_params[:category])
      expect(new_menu_item.image).to eq(menu_item_params[:image])
      expect(new_menu_item.price).to eq(menu_item_params[:price])
    end

    it 'returns an error if one or more attributes are missing' do
      restaurant = create(:restaurant, name: "Los Pollos Hermanos")
      menu_item_params = { 
                              restaurant_id: "#{restaurant.id}",
                              name: "",
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

      post "/api/v1/restaurants/#{restaurant.id}/menu_items", headers: headers, params: JSON.generate(menu_item_params)

      expect(MenuItem.all.count).to eq(0)

      error_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)

      expect(error_data).to be_a(Hash)
      expect(error_data).to have_key(:error)
      expect(error_data[:error]).to eq("One or more attributes is missing")
    end
  end

  describe 'PATCH menu items' do
    it "can edit individual menu items that belong to a restaurant" do
      restaurant1 = Restaurant.create!(name: "Arby's", description: "We have the meats!", logo: "arbys.com")
      
      tiramisu = MenuItem.create!(name: "Tiramisù", description: "Yum yum cake", tags: "Sweet", category: "food", image: "www.cake.com", price: 5.55, restaurant_id: restaurant1.id)
      beans_toast = MenuItem.create!(name: "Beans on Toast", description: "English Classic!", tags: "Beanzz", category: "all day food", image: "www.Britfood.com", price: 100.00, restaurant_id: restaurant1.id)
      
      expect(tiramisu.name).to eq("Tiramisù")
      expect(tiramisu.description).to eq("Yum yum cake")

      menu_item_body = {
        "name": "Tiramisu", 
        "description": "A tasty cake!",
        "tags": "Sweet",
        "category": "food",
        "image": "www.cake.com",
        "price": 5.55
      }

      patch "/api/v1/restaurants/#{restaurant1.id}/menu_items/#{tiramisu.id}", headers: {'CONTENT_TYPE' => 'application/json' }, params: JSON.generate(menu_item_body)
      
      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(json_response).to be_a(Hash)
      expect(json_response).to have_key(:data)
      expect(json_response[:data]).to be_an(Hash)
    
      expect(json_response[:data].size).to eq(3)
      expect(json_response[:data]).to have_key(:id)

      expect(json_response[:data]).to have_key(:type)
      expect(json_response[:data][:type]).to eq("menu_item")
      
      expect(json_response[:data]).to have_key(:attributes)
      expect(json_response[:data][:attributes].size).to eq(7)

      expect(json_response[:data][:attributes]).to have_key(:restaurant_id)
      expect(json_response[:data][:attributes][:restaurant_id]).to be_a(Integer)
      
      expect(json_response[:data][:attributes]).to have_key(:name)
      expect(json_response[:data][:attributes][:name]).to be_a(String)
      expect(json_response[:data][:attributes][:name]).to_not eq(beans_toast.name)

      expect(json_response[:data][:attributes]).to have_key(:description)
      expect(json_response[:data][:attributes][:description]).to be_a(String)
      expect(json_response[:data][:attributes][:description]).to_not eq(beans_toast.description)
      
      expect(json_response[:data][:attributes]).to have_key(:tags)
      expect(json_response[:data][:attributes][:tags]).to be_a(String)
      expect(json_response[:data][:attributes][:tags]).to_not eq(beans_toast.tags)
      
      expect(json_response[:data][:attributes]).to have_key(:category)
      expect(json_response[:data][:attributes][:category]).to be_a(String)
      expect(json_response[:data][:attributes][:category]).to_not eq(beans_toast.category)

      expect(json_response[:data][:attributes]).to have_key(:image)
      expect(json_response[:data][:attributes][:image]).to be_a(String)
      expect(json_response[:data][:attributes][:image]).to_not eq(beans_toast.image)

      expect(json_response[:data][:attributes]).to have_key(:price)
      expect(json_response[:data][:attributes][:price]).to be_a(Float)
      expect(json_response[:data][:attributes][:price]).to_not eq(beans_toast.price)
    end

    it 'menu item update sad path' do
      restaurant1 = Restaurant.create!(name: "Arby's", description: "We have the meats!", logo: "arbys.com")
      create_list(:menu_item, 5, restaurant: restaurant1)

      tres_leches = MenuItem.create!(name: "Tres Leches", description: "Yum yum cake", tags: "Sweet", category: "food", image: "www.cake.com", price: 5.55, restaurant_id: restaurant1.id)

      expect(tres_leches.name).to eq("Tres Leches")
      expect(tres_leches.description).to eq("Yum yum cake")

      menu_item_body = {
        "name": "", 
        "description": "A tasty cake!",
        "tags": "Sweet",
        "category": "food",
        "image": "www.cake.com",
        "price": 5.55
      }

      patch "/api/v1/restaurants/#{restaurant1.id}/menu_items/#{tres_leches.id}", headers: {'CONTENT_TYPE' => 'application/json' }, params: JSON.generate(menu_item_body)
      
      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response).to have_key(:error)
      expect(json_response).to_not have_key(:data)
      expect(json_response[:error]).to eq("One or more attributes is missing")
    end
  end

  describe 'DELETE menu items' do
    it 'can delete menu items that belong to a restaurant' do
      restaurant = create(:restaurant, name: "Los Pollos Hermanos")
      menu_item = create(:menu_item, restaurant: restaurant, name: "Spice Curls")

      expect(MenuItem.count).to eq(1)

      headers = {
                    'Content-Type' => 'application/json',
                    'Accept' => 'application/json'        
                }

      delete "/api/v1/restaurants/#{restaurant.id}/menu_items/#{menu_item.id}", headers: headers

      response_data = JSON.parse(response.body, symbolize_names: true)
      require 'pry'; binding.pry
      expect(response).to have_http_status(200)
      expect(response_data).to have_key(:message)
      expect(response_data[:message]).to eq("Menu item has successfully been deleted at this restaurant")

      expect(MenuItem.count).to eq(0)
      expect{MenuItem.find(menu_item.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'returns an error if no menu item can be found' do
      restaurant = create(:restaurant, name: "Los Pollos Hermanos")
      menu_item = create(:menu_item, id: 1, restaurant: restaurant, name: "Spice Curls")

      expect(MenuItem.count).to eq(1)

      headers = {
                    'Content-Type' => 'application/json',
                    'Accept' => 'application/json'        
                }

      delete "/api/v1/restaurants/#{restaurant.id}/menu_items/2", headers: headers

      expect(MenuItem.count).to eq(1)

      error_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)

      expect(error_data).to be_a(Hash)
      expect(error_data).to have_key(:error)
      expect(error_data[:error]).to eq("No menu item exists with that id at this restaurant")
    end
  end
end