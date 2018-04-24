class GroupsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @groups = Group.all 
  end
  def create 
    user = User.find(session[:user_id])
    g = Group.new(name: params[:name], description: params[:description], user: user)
    if g.valid?
      g.save
    flash[:messages] = ['Group Added!']
    else 
      flash[:messages] = g.errors.full_messages
    end 
    redirect_to '/groups'
  end 
  def show 
    @group = Group.find(params[:id])
    @joins = Join.joins(:group).where(group_id: @group.id)
  end 
  def destroy 
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to '/groups'
  end 
end
