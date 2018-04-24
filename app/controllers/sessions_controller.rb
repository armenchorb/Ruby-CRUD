class SessionsController < ApplicationController
  def index
  end
  def create
    u = User.find_by(email: params[:email])
    if u && u.authenticate(params[:password])
      session[:user_id] = u.id
      redirect_to '/groups'
    else 
      flash[:messages] = ['Invalid Login']
      redirect_to '/'
    end 
  end
end
