class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.admin?
        redirect_to admin_path, notice: "Logged in!"
      else
        redirect_to user_path(current_user), notice: "Logged in!"
      end
    else
      flash.now.alert = "Username or password is invalid"
      redirect_to '/', notice: "Invalid username or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', notice: "Logged out!"
  end
end
