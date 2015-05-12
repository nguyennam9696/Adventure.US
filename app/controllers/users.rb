get '/' do
  if logged_in?
    redirect "/users/#{current_user.id}/events"
  else
    erb :index
  end
end

post '/login' do
  user = User.where(email: params[:email]).first
  if user && user.authenticate(params[:password])
    login(user)
    redirect "/users/#{user.id}/events"
  else
    user.errors.add(:login, "Username / Password input is incorrect. Please try again.")
    erb :index
  end
end

delete '/logout' do
  logout!
  redirect "/"
end

post '/signup' do
  user = User.new(params[:new])
  if user.save
    login(user)
    redirect "/users/#{user.id}/events"
  else
    user.errors.add(:signup, "Please input all fields correctly.")
    erb :index
  end
end

get '/users/:id/events' do
  @user = User.where(id: params[:id]).first
  @events = Event.all
  erb :"users/events"
end

# post '/users/:id/events' do

# end

