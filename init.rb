plugin_name = :vhod_change_user

Redmine::Plugin.register plugin_name do
  name 'Vhod Change User'
  description 'Temporarly changes user in session'
  author 'ELINS'
  version '0.0.1'

end
Rails.configuration.to_prepare do
  require_patch plugin_name, %w(application_helper)
end
