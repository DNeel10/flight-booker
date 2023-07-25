class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport", foreign_key: 'departure_airport_id', inverse_of: :departing_flights
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: 'arrival_airport_id', inverse_of: :arriving_flights

  has_many :bookings, dependent: :destroy

  validates :departure_date, presence: true
  validates :departure_airport, presence: true
  validates :arrival_airport, presence: true
  validates :duration, presence: true

  def self.search(params)
    @flights = Flight.where(["departure_airport_id = :departure_airport AND arrival_airport_id = :arrival_airport AND DATE(departure_date) = :departure_date",  
                              { departure_airport: params[:departure_airport], 
                                arrival_airport: params[:arrival_airport], 
                                departure_date: params[:departure_date] }])
  end

  def self.ordered_date_options
    order(:departure_date).map(&:event_date_formatted).uniq
  end

  def event_date_formatted
    departure_date.strftime("%Y-%m-%d")
  end
end
