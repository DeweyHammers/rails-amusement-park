class SessionsController < ApplicationController

  def new
    if session[:name] != nil
      redirect_to :root
    else
      @users = User.all
    end
  end

  def create
    user = User.find_by(id: params[:user][:name])
   
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to '/signin'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
