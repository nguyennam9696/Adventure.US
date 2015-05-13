get '/' do
  if logged_in?
    redirect "/users/#{current_user.id}"
  else
    erb :index
  end
end

delete '/logout' do
  logout!
  redirect "/"
end

post '/login' do
  user = User.where(email: params[:email]).first
  if user && user.authenticate(params[:password])
    status 200
    login(user)
    redirect "/users/#{user.id}"
  else
    user.errors.add(:login, "Username / Password input is incorrect. Please try again.")
    erb :index
  end
end

post '/signup' do
  user = User.new(params[:new])
  if user.save
    status 200
    login(user)
    redirect "/users/#{user.id}/events"
  else
    user.errors.add(:signup, "Please input all fields correctly.")
    erb :index
  end
end

get '/users/:id' do
  @user = User.where(id: params[:id]).first
  erb :"users/event"
end
