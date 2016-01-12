class ResortsController < ApplicationController
  def index

  end

  def show
    @resort = Resort.find(params[:id])
    @tweets = Tweet.all.where(resort_id: @resort.id)
    @direction = Direction.find(params[:directions_id])

    respond_to do |format|
      format.html { render :show }
      format.json { render json: {'location': @resort.location} }
    end
  end

  private

  def resort_params
    params.require(:resort).permit()
  end
end
