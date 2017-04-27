class VhodChangeUserController < ApplicationController
  def change

    new_user = User.find(params['id'])
    session[:user_id] = new_user.id
    session[:tk] = new_user.generate_session_token

    redirect_to '/'

  end
end