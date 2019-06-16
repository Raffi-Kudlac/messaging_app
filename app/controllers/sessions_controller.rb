class SessionsController < ApplicationController

  before_action(:logged_in_redirect, only: [:new, :create])

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if (user && user.authenticate(params[:session][:password]))
      log_in(user)
      flash[:success] = "You have successfuly loged in"
      redirect_to root_path
    else
      flash.now[:error] = "The login was not successful"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already logged in"
      redirect_to root_path
    end
  end

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
