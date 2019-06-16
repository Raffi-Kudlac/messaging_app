class ApplicationController < ActionController::Base

  helper_method(:logged_in?)

  def logged_in?
    !!current_user
  end

  def log_in(user)
    session[:user_id] = user.id
    flash[:success] = "You have logged in"
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def log_out
    session[:user_id] = nil
    @current_user = nil
    flash[:success] = "You have logged out"
  end

  def require_user
    if (!logged_in?)
      flash[:error] = "You need to be logged in to perform that action"
      redirect_to login_path
    end
  end
end
