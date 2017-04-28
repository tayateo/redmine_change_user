class VhodChangeUserController < ApplicationController

  def change

    new_user = User.find(params['id'])

    session[:user_id] = new_user.id
    session[:tk] = new_user.generate_session_token
    session[:turn_back_to] = User.current.id
    session[:previous_user_name] = User.current.login

    redirect_to '/'

  end

  def turn_back

    previous_user = User.find(session[:turn_back_to])

    session[:user_id] = previous_user.id
    session[:tk] = previous_user.generate_session_token
    session[:turn_back_to] = nil
    session[:previous_user_name] = nil

    redirect_to '/users'

  end

end