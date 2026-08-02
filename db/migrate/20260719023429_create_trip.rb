class CreateTrip < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :flight_number
      t.string :flight_date
      t.string :trip_name
    end
  end
end
