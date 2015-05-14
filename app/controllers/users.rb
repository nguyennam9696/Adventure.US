get '/' do
  erb :index
end

delete '/logout' do
  logout!
  redirect "/"
end

get '/login' do
  erb :"users/login"
end

get '/users/new' do
  erb :"users/new"
end

get '/users/:id' do
  @user = User.where(id: params[:id]).first
  erb :"users/show"
end

get '/users/:id/categories' do
  @categories = Category.all
  return @categories.to_json
end

post '/categories' do
  main_events=[]
  params.each do |key, value|
    main_events << Category.where(adventure_type: value).first.events
    current_user.categories << Category.where(adventure_type: value).first
    current_user.save
  end
  return main_events.flatten.to_json
end

post '/login' do
  user = User.where(email: params[:email]).first
  if user && user.password = params[:password]
    login(user)
    return user.to_json
  else
    erb :index
  end
end

post '/user' do
  user = User.new
  p params
  user.first_name = params[:first_name]
  user.last_name = params[:last_name]
  user.birthday = params[:birthday]
  user.email = params[:email]
  user.username = params[:username]
  user.password = params[:password]
  if user.save
    p user
    login(user)
    return user.to_json
  else
    status 404
  end
end


