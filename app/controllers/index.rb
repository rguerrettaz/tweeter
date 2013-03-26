get '/' do
  erb :index
end

post '/' do
	redirect '/users/' + params[:username]
end

get '/users/:username' do
	if User.find_by_username(params[:username]) == nil
		@user = User.create(:username => params[:username])
	else
		@user = User.find_by_username(params[:username])
	end
  if @user.tweets_stale?
    @user.fetch_tweets
  end
  @tweets = @user.tweets
	erb :cached
end


