class JoinsController < ApplicationController
  def create
    user = User.find(session[:user_id])
    group = Group.find(params[:id])
    joined_group = Join.new(user:user, group: group)
    if joined_group.valid?
      joined_group.save
    end 
    redirect_to '/groups'
  end
  def destroy 
    user = User.find(session[:user_id])
    group = Group.find(params[:id])
    @join = Join.find_by(user: user, group: group)
    @join.destroy
    redirect_to '/groups'
  end 
end
