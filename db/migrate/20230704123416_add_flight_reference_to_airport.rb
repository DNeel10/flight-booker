class AddFlightReferenceToAirport < ActiveRecord::Migration[7.0]
  def change
    add_reference :flights, :departure_airport
    add_reference :flights, :arrival_airport
  end
end
