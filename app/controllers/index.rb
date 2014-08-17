require "Twitter"

class User

  def initialize(args)
    @client = args[:client]
    @handle = args[:handle]
  end

  def twitterStats
    data ={tweets: tweetText, time: avgTweetTime, birdType: birdType }
  end

  def tweetText
    tweets = []
    tweetsFrom.each do |tweet|
      tweets << tweet.text
    end
    tweets
  end

  def tweetTimes
    hours = []
    tweetsFrom.each do |tweet|
      hours << tweet.created_at.hour
    end
    hours
  end

  def avgTweetTime
    tweetTimes.inject(:+)/tweetTimes.length
  end

  def birdType
    time = avgTweetTime
    if 23 < time || time < 4
      return "a night owl"
    elsif time < 9
      return "an early bird"
    elsif time < 15
      return "a tweety bird"
    else time < 23
      return "an angry bird"
    end
  end

  def tweetsFrom
    tweets = []
    @client.search("from:#{@handle}").each do |tweet|
      tweets << tweet
    end
    tweets
  end

end


get '/' do
  erb :index
end

post '/' do
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "Gbds4c1bCCtNYcwPQE1LNgVPw"
    config.consumer_secret     = "QC4QE9ECYhx8ZYWHlrrYTnAB9i3mQkn3ipu4eRWIx9MhrfJoCg"
    config.access_token        = "2467294044-K5mf5Id297At9I7mgTZcGjQY8mP4bNfhQdxsxsP"
    config.access_token_secret = "TqzsYqm1ZAoHqn6nFxUGi3P8Tq3NIx9lAwJjYjF9D1eI5"
  end
  user = User.new(handle: params[:handle], client: client)
  returnVal = user.twitterStats
  if request.xhr?
    content_type :json
    returnVal.to_json
  end
end
