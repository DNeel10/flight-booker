class PassengerMailer < ApplicationMailer
  
  def confirmation_email
    @booking = Booking.find(params[:booking_id])
    mail to: @booking.passengers.pluck(:email), subject: 'Information about your booking'
  end
end
