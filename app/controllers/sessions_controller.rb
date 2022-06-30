class SessionsController < ApplicationController
  def new
  end

  def create
   if user
    @user = User.new(user_params)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Logged in!"
   else
    flash.now.alert = "Invalid email or password"
    render "new"
   end
  end

   def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
   end
  end