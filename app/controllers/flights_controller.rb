class FlightsController < ApplicationController
  def index
    @flights = Flight.search(params[:search][:departure_date])

    @date_options = Flight.all.map { |d| [d.start, d.start] }
    @airport_options = Airport.all.map { |a| [a.code, a.id] }

  end
end
