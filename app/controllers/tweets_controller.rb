class TweetsController < ApplicationController

  def index
    since = params[:since] || 7.days.ago
    from_date = since.class == String ? DateTime.strptime(since, '%Y-%m-%d') : since

    @tweets = Tweet.where(created_at: from_date..Time.current).first(20)
  end

  private

    def tweet_params
      params.require(:tweet).permit(:handle, :link, :since, :limit, :links_only)
    end

end
