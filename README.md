# Tolerance
Nice things liberals say about Trump supporters.

### The Stuff
Yes, there's an API!
Base url: https://lib-tolerance.herokuapp.com/api/v1

Tolerance has one endpoint, **Tweets**. No authentication is required.

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
