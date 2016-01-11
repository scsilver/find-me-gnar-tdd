class DirectionsController < ApplicationController
  def new
    @direction = Direction.new
  end
  def create
    @direction = Direction.new(direction_params)
    if @direction.save
      redirect_to @direction
    else
    end
  end
  def show
    @direction = Direction.find(params[:id])
    geo = Geolocator.new(@direction.from)
    geo.json
    resorts = geo.distance
    resorts = Resort.sort_by_distance(resorts)
    @resorts = @direction.sorted_resorts

  end
  private

  def direction_params
    params.require(:direction).permit(:from)
  end
end
