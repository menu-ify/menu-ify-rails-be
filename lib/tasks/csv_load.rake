require 'csv'
require 'json'

namespace :csv_load do 
  task json_to_csv: :environment do 
    CSV.open("./db/data/restaurants.csv", "w") do |csv| 
      JSON.parse(File.open("./db/data/restaurant-mock-data.json").read).each do |hash|
        csv << hash.flatten.last["attributes"].keys
        hash[1].each do |rest|
          csv << rest["attributes"].values 
        end
      end
    end

    CSV.open("./db/data/menu_items.csv", "w") do |csv| 
      JSON.parse(File.open("./db/data/menu-items-mock-data.json").read).each do |hash|
        csv << hash.flatten.last["attributes"].keys
        hash[1].each do |rest|
          csv << rest["attributes"].values
        end
      end
    end
  end 

  task restaurants: :environment do 
    CSV.foreach('./db/data/restaurants.csv', headers: true) do |row|
      Restaurant.create!(row.to_hash)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('restaurants')
  end

  task menu_items: :environment do 
    CSV.foreach('./db/data/menu_items.csv', headers: true) do |row|
      MenuItem.create!(row.to_hash)
    end
    MenuItem.all.map {|item| item.update(tags: item.tags.gsub!(/[^.,a-zA-Z0-9 \n\,]/, ''))}
    ActiveRecord::Base.connection.reset_pk_sequence!('menu_items')
  end

  task all: :environment do 
    Rake::Task["csv_load:restaurants"].invoke
    Rake::Task["csv_load:menu_items"].invoke
  end

  task delete_all: :environment do 
    MenuItem.destroy_all
    Restaurant.destroy_all 
  end
end
