# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do 
  restaurant = Restaurant.create(name: Faker::Restaurant.name, description: Faker::Restaurant.description, logo: Faker::Internet.url)
  5.times do 
    restaurant.menu_items.create(name: Faker::Food.dish, description: Faker::Food.description, allergens: Faker::Food.ingredient, category: Faker::Food.ethnic_category, image: Faker::Internet.url, price: Faker::Number.decimal(l_digits: 2, r_digits: 2) ) 
  end
end