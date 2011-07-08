class SessionsController < ApplicationController
  
  def create
    session[:user_id] =     User.find_or_create_by_auth(request.env["omniauth.auth"]).id
    redirect_to products_path
  end
  
  def failure
  end
end
