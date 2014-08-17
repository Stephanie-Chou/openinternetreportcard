require "Twitter"

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "Gbds4c1bCCtNYcwPQE1LNgVPw"
  config.consumer_secret     = "QC4QE9ECYhx8ZYWHlrrYTnAB9i3mQkn3ipu4eRWIx9MhrfJoCg"
  config.access_token        = "2467294044-K5mf5Id297At9I7mgTZcGjQY8mP4bNfhQdxsxsP"
  config.access_token_secret = "TqzsYqm1ZAoHqn6nFxUGi3P8Tq3NIx9lAwJjYjF9D1eI5"
end

class User

  def initialize(args)
    @handle = args[:handle]
    @avgTweetTime
  end
  def getTweetsFrom(num, client)
    tweets = []
    client.search("from:#{@handle}", :result_type =>"recent").take(num).each do |tweet|
      tweets << tweet
    end
    tweets
  end

  def getTwitterStats

    data ={tweets: getTweetsFrom(1,client)}


  end
end
