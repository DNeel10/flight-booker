class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build
    params[:passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @flight = Flight.find(booking_params[:flight_id])
    @booking = @flight.bookings.build(booking_params)
    
    if @booking.save
      PassengerMailer.with(booking_id: @booking.id).confirmation_email.deliver_now
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private

    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: %i[id firstname lastname email])
    end
end
