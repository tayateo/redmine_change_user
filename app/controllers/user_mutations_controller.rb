class UserMutationsController < ApplicationController

  before_filter :require_admin, :except => :destroy

  def update
    change_user = User.find(params['id'])
    change_user_in_session change_user
    session[:turn_back_to] = User.current.id
    session[:initial_user_name] = User.current.login
    redirect_back_or_default home_url
  end

  def destroy
    initial_user = User.find(session[:turn_back_to])
    change_user_in_session initial_user
    session[:turn_back_to] = nil
    session[:initial_user_name] = nil
    redirect_back_or_default users_path
  end

  def change_user_in_session(user)
    session[:user_id] = user.id
    session[:tk] = user.generate_session_token
  end
end