RedmineApp::Application.routes.draw do

  match '/change/user/:id', :to => 'vhod_change_user#change', :as => 'vhod_change_user', via: [:get, :post]
  match '/turn_back_to/user/:id', :to => 'vhod_change_user#turn_back', :as => 'vhod_turn_back', via: [:get, :post]

end