FactoryBot.define do
  factory :restaurant do
    name { Faker::Restaurant.name }
    description { Faker::Restaurant.description }
    logo { Faker::Food.ingredient }
  end
end