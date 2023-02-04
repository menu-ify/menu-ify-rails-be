require 'rails_helper'

RSpec.describe 'return all restaurants' do 
  it '/restaurants' , :vcr do 
    get "/api/v1/restaurants"
    expect(response).to be_successful 

    restaurants = JSON.parse(response.body, symbolize_names: true)[:data]

  end
end