class Api::V1::TweetsController < ApplicationController

  def index
    limit = tweet_params[:limit] ||  1000
    since = tweet_params[:since] || 7.days.ago

    from_date = DateTime.strptime(since, '%Y-%m-%d') || 7.days.ago
    tweets = Tweet.where(created_at: from_date..Time.current)

    tweets = tweets.joins(:handle).where(tweets: {handle_id: Handle.find_by(screen_name: tweet_params[:handle]).id }) if !!tweet_params[:handle]
    tweets = tweets.map(&:link) if tweet_params.keys.any? { |key| key.downcase == 'links_only' }

    render json: {meta: {success: true}, data: tweets.first(limit)}
  end

  private

    def tweet_params
      params.permit(:handle, :limit, :links_only, :since)
    end

end
