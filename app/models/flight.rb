class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport", foreign_key: 'departure_airport_id', inverse_of: :departing_flights
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: 'arrival_airport_id', inverse_of: :arriving_flights

  def self.search(params)
    @flights = Flight.where("departure_airport_id = ?",  params[:departure_airport])
      .where("arrival_airport_id = ?",  params[:arrival_airport])
      .where("DATE(departure_date) = ?", params[:departure_date])
  end

  def self.ordered_date_options
    order(:departure_date).map(&:event_date_formatted).uniq
  end

  def event_date_formatted
    departure_date.strftime("%Y-%m-%d")
  end
end
