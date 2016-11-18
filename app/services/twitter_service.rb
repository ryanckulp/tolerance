class TwitterService

  class << self
    def search(query, options={})
      Blue.search(query, options).to_a
    end

    def keywords
      Keyword.all.map(&:query)
    end

    def import_tweets
      keywords.each do |keyword|
        tweets = search(keyword)
        tweets.each {|tweet| process_tweet(tweet)}
      end
    end

    def process_tweet(tweet)
      return if Tweet.find_by(external_id: tweet.id)

      handle = Handle.find_or_create_by(screen_name: tweet.user.handle)
      handle.update(name: tweet.user.name, avatar: tweet.user.profile_image_uri.to_s)

      tweet_params = {external_id: tweet.id, text: tweet.full_text, link: tweet.url.to_s,
                      likes: tweet.favorite_count, media: tweet.media, handle_id: handle.id}

      t = Tweet.create(tweet_params)
      t.update(created_at: tweet.created_at.to_datetime)
    end

  end
end
