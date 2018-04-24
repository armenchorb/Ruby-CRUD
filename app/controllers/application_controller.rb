class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def require_login
    redirect_to new_sessions_path if session[:user_id] == nil
  end
  
  def destroy
    session[:user_id] == nil
    redirect_to '/'
  end 
end
