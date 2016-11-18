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
      handle = Handle.find_or_create_by(screen_name: tweet.user.handle)
      handle.update(name: tweet.user.name, avatar: tweet.user.profile_image_uri.to_s)

      tweet_params = {text: tweet.full_text, link: tweet.url.to_s, handle_id: handle.id}
      t = Tweet.create(tweet_params)

      t.media << tweet.media
      t.media.flatten!
      t.save!
    end

  end
end
