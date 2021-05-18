class RidesController < ApplicationController
  def create
    ride = Ride.new(ride_params)

    if ride.save
      redirect_to user_path(ride.user), notice: ride.take_ride
    else
      redirect_to attraction_path(params[:ride][:attraction_id])
    end
  end 

  private

  def ride_params
    params.require(:ride).permit(:attraction_id, :user_id)
  end
end