class ChangeIdStartingValueRestaurants < ActiveRecord::Migration[5.2]
  def change
    execute "SELECT setval('restaurants_id_seq', 100)"
  end
end
