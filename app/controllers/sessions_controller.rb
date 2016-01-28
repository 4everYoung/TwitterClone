class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by_username(params[:username])
      if user && user.authenticate(params[:password])
          session[:userid] = user.id
          redirect_to root_url, notice: "Logged in!"

      #user=User.find_by(email: params[:session][:email].downcase)
      #if user && user.authenticate(params[:session][:password])
      #session[:userid] = user.id
      #redirect_to root_url, notice: "Logged in!"
      else
          flash[:error] = "Wrong Username or Password."
          redirect_to root_url
      end
  end

  def destroy
      session[:userid] = nil
      @current_user = nil
      redirect_to root_url, notice: "Logged out."
  end
end
