class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def show
    @user = User.find_by(id: params[:id])
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end

  def require_login
    redirect_to root_path unless session.include? :user_id
  end
end
