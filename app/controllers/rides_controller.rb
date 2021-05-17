class RidesController < ApplicationController
  def create
    attraction = Attraction.find_by(id: params[:ride][:attraction_id])
    user = User.find_by(id: params[:ride][:user_id])
    ride = Ride.create(attraction_id: attraction, user_id: user)
    byebug
    ride.take_ride
    redirect_to users_path(ride.user)
  end 
end