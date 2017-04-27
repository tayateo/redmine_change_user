RedmineApp::Application.routes.draw do
  match '/change/user/:id', :to => 'vhod_change_user#change', :as => 'vhod_change_user', via: [:get, :post]
end