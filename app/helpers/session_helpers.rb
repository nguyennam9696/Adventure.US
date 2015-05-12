helpers do

  def login(user)
    session[:user] = user.id
  end

  def logout!
    session.clear
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    if session[:user]
      @current_user ||= User.find(session[:user])
    end
  end

end