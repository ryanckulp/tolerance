class Api::V1::TweetsController < ApplicationController

  def index
    since = params[:since]
    tweets = Tweet.where(created_at: since.to_datetime..Time.current)

    render json: {data: tweets}
  end

  private

    def tweet_params
      params.require(:tweet).permit(:link, :since, :limit)
    end

end
