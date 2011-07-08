class SessionsController < ApplicationController
  
  def create
    # render :text => [
    #       request.env["omniauth.auth"]["provider"],
    #       request.env["omniauth.auth"]["uid"],
    #       request.env["omniauth.auth"]["user_info"]["name"]].join(", ")
    #raise "bang!"
    @user = User.find_or_create_by_auth(request.env["omniauth.auth"])
  end
end
