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
    @direction = Direction.find(params[:id])
    resorts = Geolocator.new(@direction.from).distance
    @resorts = Resort.sort_by_distance(resorts)


    respond_to do |format|
      format.html { render :show }
      format.json { render json: {'from': @direction.from, 'direction_id': @direction.id} }
    end
  end
  private

  def set_direction
    @direction = Direction.find(params[:id])
  end

  def direction_params
    params.require(:direction).permit(:from)
  end
end
