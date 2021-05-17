class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    session[:user_id] = nil
  end
end
