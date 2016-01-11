class ResortsController < ApplicationController
  def index

  end

  def show
    @resort = Resort.find(params[:id])
    @tweets = Tweet.all.where(resort_id: @resort.id)
  end

  private

  def resort_params
    params.require(:resort).permit()
  end
end
