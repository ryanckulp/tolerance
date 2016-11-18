namespace :twitter do
  desc "Imports tweets matching keywords in database"
  task import_tweets: :environment do
    TwitterService.import_tweets
  end
end
