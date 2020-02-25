class BookingsController < ApplicationController
  before_action :set_bicycle

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.bicycle = @bicycle
    if @booking.save
      redirect_to bicycle_booking_path(@booking)
    else
      render :new
    end
  end

  private

  def set_bicycle
    @bicycle = Bicycle.find(params[:bicycle_id])
  end

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
