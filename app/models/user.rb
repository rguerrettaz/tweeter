class User < ActiveRecord::Base
  has_many :tweets


	def tweets_stale?

		if self.tweets.nil? || self.tweets.last.nil?
			true
		elsif self.tweets.last.created_at > 0.seconds.ago
			self.tweets.destroy_all
			false
		else
			true
		end 
	end

	def fetch_tweets
		from_twitter = Twitter.user_timeline(self.username)[0..9]
		from_twitter.each do |tweet|
			self.tweets << Tweet.create(:content => tweet.text,)
		end
	end

end
