require 'csv'
require 'json'

namespace :csv_load do 
  task json_to_csv: :environment do 
    CSV.open("./db/data/restaurants.csv", "w") do |csv| 
      JSON.parse(File.open("./db/data/restaurant-mock-data.json").read).each do |hash|
        csv << hash.flatten.last["attributes"].keys
        hash[1].each do |rest|
          # require 'pry'; binding.pry
          csv << rest["attributes"].values 
        end
      end
    end

    CSV.open("./db/data/menu_items.csv", "w") do |csv| 
      JSON.parse(File.open("./db/data/menu-items-mock-data.json").read).each do |hash|
        csv << hash.flatten.last["attributes"].keys
        hash[1].each do |rest|
          # require 'pry'; binding.pry
          csv << rest["attributes"].values 
        end
      end
    end
  end 
end
