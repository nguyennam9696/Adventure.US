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
      @current_user ||= User.where(session[:user]).first
      if @current_user == nil
        @curent_user.clear
      end
    end
  end

end