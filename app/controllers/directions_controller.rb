class DirectionsController < ApplicationController
  before_action :set_direction, only: [:show]
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
    resorts = Geolocator.new(@direction.from).distance
    @resorts = Resort.sort_by_distance(resorts)
  end
  private

  def set_direction
    @direction = Direction.find(params[:id])
  end

  def direction_params
    params.require(:direction).permit(:from)
  end
end
