class UsersController < ApplicationController
  def dashboard
    @bicycles = current_user.bicycles
    @bookings = current_user.bookings
    @bicycle_bookings = current_user.booked_bicycles
  end

  def edit
  end

end
