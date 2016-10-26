class SessionsController < ApplicationController
  def new
    # render plain: "asd"
  end

  def create
    user=User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id]=user.id
      redirect_to home_path, notice: "you log in successfully."
    else
      flash.now[:alert]="wrong email or password"
      render :new
    end

  end

  def destroy
    session[:user_id]=nil
    redirect_to home_path,notice: "sign out"


  end




end
