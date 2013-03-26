get '/' do
  erb :index
end

post '/' do
	redirect '/users/' + params[:username]
end

get '/users/:username' do
	if User.find_by_username(params[:username]) == nil
		@user = User.create(:username => params[:username])
		session[:id] = @user.id

	else
		@user = User.find_by_username(params[:username])
		session[:id] = @user.id
	end

  erb :cached
 #  
	# 
end

get '/refresher_dawg' do
	@user = User.find(session[:id])
	@user.fetch_tweets
  @tweets = @user.tweets
  erb :_tweet_list, :layout => false
end


