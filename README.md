# Tolerance
Nice things liberals say about Trump supporters.

### Quickstart

1. Clone the repo
2. Retrieve API keys (`config/initializers/twitter.rb`) from repo admin, OR [use your own keys](https://apps.twitter.com)
3. `$ rake db:setup && rake db:migrate`
4. Open rails console (`$ rails c`) then run TwitterService.import_tweets
5. Run server in browser via `rails s`
6. More operations below

### API

Tolerance has one endpoint, **Tweets**. No authentication is required.

Base URL: https://lib-tolerance.herokuapp.com/api/v1

Simply `GET` to /tweets with the following (optional) params:

* `since` (string in YYYY-MM-DD format, to only retrieve tweets since this day)
* `limit` (integer representing a max number of tweets to return; threshold and default is 1000)
* `links_only=true` (default false, will return only links to tweets)
* more TBD

Every response contains 2 nodes -- meta, and data.

**Example**

request:
`GET https://lib-tolerance.herokuapp.com/api/v1/tweets?since=2016-11-01&limit=20&links_only=true`

response: `{"meta":{"success":true},"data":[]}`

### Database Operations
Tolerance uses the [ActiveRecord](http://guides.rubyonrails.org/active_record_basics.html) ORM and PostgreSQL.

```
$ rails c # or 'heroku run rails c, for prod environment'
# connecting...

# get a tweet
tweet = Tweet.find_by(external_id: 'twitter-id-here')
tweet.text # => "yada yada i think we should kill trump supporters..."
tweet.link # => direct link to tweet

# get a user
handle = Handle.last
handle.avatar # => returns profile image
handle.screen_name

# view all the tweets from an offending user
handle = Handle.find_by(screen_name: 'somebody-real-bad')
handle.tweets # => returns an enumerable collection of tweets
```

### To Do

* Implement search
* Ability to suggest keywords (currently, Keyword table is locked)
* Data visualization (sentiment analysis, analyzed /day, etc)
* Export to CSV
* Etc.
