require "Twitter"
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "Gbds4c1bCCtNYcwPQE1LNgVPw"
  config.consumer_secret     = "QC4QE9ECYhx8ZYWHlrrYTnAB9i3mQkn3ipu4eRWIx9MhrfJoCg"
  config.access_token        = "2467294044-K5mf5Id297At9I7mgTZcGjQY8mP4bNfhQdxsxsP"
  config.access_token_secret = "TqzsYqm1ZAoHqn6nFxUGi3P8Tq3NIx9lAwJjYjF9D1eI5"
end


class User

  def initialize(args)
    @client = args[:client]
    @handle = args[:handle]
  end
  def tweetsFrom
    tweets = []
    @client.search("from:#{@handle}").each do |tweet|
      tweets << tweet
    end
    tweets
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

  def twitterStats
    data ={tweets: tweetsText}
  end
end

user= User.new({handle: "DukeGreene", client:client})
p user.avgTweetTimes

# getTweetsFrom('yaboybillnye', 4, client)


# HOW TO RETWEET

# class Retweet

# 	def initialize(tweet)
# 		@rt = "#tweet_tweet RT @"
# 		@tweet = tweet
# 		@original_user = tweet.user.screen_name
# 		@original_tweet = tweet.text
# 		@new_tweet = compose_new_tweet
# 	end

# 	def compose_new_tweet
# 		@rt + @original_user+ " " + @original_tweet
# 	end

# 	def too_long?
# 		@new_tweet.length > 140 ? true : false
# 	end

# 	def edit
# 		@new_tweet.gsub!(/\band\b/, '&')
# 		@new_tweet.gsub!(/\byou're\b/, 'ur')
# 		@new_tweet.gsub!(/\byou\b/, 'u')
# 		@new_tweet.gsub!(/\bare\b/, 'r')
# 		@new_tweet.gsub!(/'/, '')
# 		@new_tweet.gsub!(/\bat\b/, '@')
# 		@new_tweet = @new_tweet[0..136] + "..."
# 	end

# 	def retweet
# 		edit if too_long?
# 		# client.update(@new_tweet)
# 	end
# end


# users = ["sradloff23"]
# users.each do |user|
# 	recent_tweets = client.user_timeline(user).take(5)
# 	recent_tweets.each do |tweet|
# 		retweet = Retweet.new(tweet)
# 		retweet.retweet
# 	end
# end



