class UserMutationsController < ApplicationController
  def create
    if User.current.admin?
      change_user = User.find(params['id'])
      session[:user_id] = change_user.id
      session[:tk] = change_user.generate_session_token
      session[:turn_back_to] = User.current.id
      session[:initial_user_name] = User.current.login
      redirect_back_or_default home_url
    end
  end

  def destroy
    if User.current.admin?
      initial_user = User.find(session[:turn_back_to])
      session[:user_id] = initial_user.id
      session[:tk] = initial_user.generate_session_token
      session[:turn_back_to] = nil
      session[:initial_user_name] = nil
      redirect_back_or_default users_path
    end
  end
end