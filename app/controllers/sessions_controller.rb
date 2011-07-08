class SessionsController < ApplicationController
  
  def create
    session[:user_id] =     User.find_or_create_by_auth(request.env["omniauth.auth"]).id
    redirect_to products_path, :notice => "Welcome!"
  end
  
  def failure
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to products_path, :notice => "You've been logged out!"
  end
end
