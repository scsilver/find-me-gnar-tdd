class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  private
  def ride_params
    params.permit(:id)
  end
end
