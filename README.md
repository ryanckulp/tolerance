# Tolerance
A collection of things liberals say about Trump supporters.

### Stuff
Aha, there's an API!
Base url: https://lib-tolerance.herokuapp.com/api/v1

Tolerance has one endpoint, **Tweets**.

Simply `GET` to /tweets with the following (optional) params:

* since (string in YYYY-MM-DD format, to only retrieve tweets since this day)
* links_only=true (default false, will return only links to tweets)
* more TBD

**Example**

```
GET https://lib-tolerance.herokuapp.com/api/v1/tweets?link_only=true&since=2016-11-01
```
