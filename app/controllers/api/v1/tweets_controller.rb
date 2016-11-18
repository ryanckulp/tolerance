class Api::V1::TweetsController < ApplicationController

  def index
    limit = !!params[:limit] ? params[:limit].to_i : 1000
    since = params[:since] || 7.days.ago
    from_date = since.class == String ? DateTime.strptime(since, '%Y-%m-%d') : since

    tweets = Tweet.where(created_at: from_date..Time.current)
    tweets = tweets.map(&:link) if !!params[:links_only]

    render json: {meta: {success: true}, data: tweets.first(limit)}
  end

  private

    def tweet_params
      params.require(:tweet).permit(:handle, :link, :since, :limit, :links_only)
    end

end
