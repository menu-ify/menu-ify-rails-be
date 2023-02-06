FactoryBot.define do
  factory :menu_item do
    restaurant
    name { Faker::Food.unique.dish }
    description { Faker::Food.description }
    tags { Faker::Food.ingredient }
    category { Faker::Food.ethnic_category }
    image { Faker::Internet.url }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end