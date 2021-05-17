class AttractionsController < ApplicationController
  def index 
    @attractions = Attraction.all
  end

  def show
    @attractions = Attraction.find_by(id: params[:id])
  end
end
