class SessionsController < ApplicationController
  
  def create
    user = User.find_or_create_by_auth(request.env["omniauth.auth"])
    load_order.user_logs_in(user)
    session[:user_id] = user.id
    redirect_to products_path, :notice => "Welcome!"
  end
  
  def failure
  end
  
  def destroy
    session[:user_id] = nil
    load_order.user_logs_out
    redirect_to products_path, :notice => "You've been logged out!"
  end
end
