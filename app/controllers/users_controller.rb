class UsersController < ApplicationController
  def create
    u = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email],password: params[:password])
    if u.valid?
      u.save
      flash[:messages] = ['Success!']
    else 
      flash[:messages] = u.errors.full_messages
    end 
    redirect_to '/'
  end
end
