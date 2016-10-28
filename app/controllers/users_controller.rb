class UsersController < ApplicationController

  def new
    @user=User.new
    # render plain: "asd"

  end

  def create
    user_params= params.require(:user).permit([:first_name, :last_name, :email, :password, :password_confirmation])
    @user=User.create(user_params)
    if @user.save
      session[:user_id]=@user.id
      redirect_to home_path, notice: "Thanks for your sign in"
    else
      render :new


    end

  end

  def edit
    @user=User.find(params[:id])

  end

  def update
    user_params=params.require(:user).permit(:first_name, :last_name, :email)

    @user=User.find(params[:id])
    # user_params[:password]=@user.password
    # user_params[:password]=session[:user_id].password



    if @user.update(user_params)
      redirect_to home_path, notice: "you have change your info"
    else
      redirect_to home_path, notice: "sth wrong"



    end

    def changepassword
      # render plain: "changepassword"


      # render plain: "changepassword"


    end

    def changepassword_update
      user_id=params[:id]
      olderpassword=params[:oldpassword]
      password=params[:password]
      password_confirmation=params[:password_confirmation]

      user=User.find(user_id)


      if user.authenticate(olderpassword) && password==password_confirmation
        user.update({password: password})
        redirect_to home_path, notice: "successfully change your password"
      else
        flash.now[:notice]="wrong!!Please try again"
        render :changepassword

      end

    end

  end
end

