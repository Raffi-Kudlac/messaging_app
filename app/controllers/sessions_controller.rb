class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if (user && user.authenticate(params[:session][:password]))
      log_in(user)
      flash[:success] = "You have successfuly loged in"
      redirect_to root_path
    else
      flash.now[:danger] = "The login was not successful"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
