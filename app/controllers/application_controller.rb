class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_sign_in?
    session[:user_id].present?
  end

  helper_method :user_sign_in?

  def current_user
    @current_user||=User.find(session[:user_id]) if user_sign_in?
  end

  def authenticate_user
    redirect_to home_path,notice: "please sign in first" unless user_sign_in?
  end


end
