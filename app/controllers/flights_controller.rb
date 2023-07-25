class FlightsController < ApplicationController
  def index
    @flights = Flight.search(search_params)

    @date_options = Flight.ordered_date_options
    @airport_options = Airport.pluck(:code, :id)
  end

  private
  
    def search_params
      params.permit(:departure_airport, :arrival_airport, :departure_date, :num_tickets)
    end
end
