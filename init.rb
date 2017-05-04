plugin_name = :vhod_change_user

Redmine::Plugin.register plugin_name do
  name 'Vhod Change User'
  description 'Temporarily changes user in session'
  author 'ELINS'
  version '0.0.1'
end

Rails.application.config.after_initialize do
  test_dependencies = {redmine_base_deface: '0.0.1'}
  current_plugin = Redmine::Plugin.find(plugin_name)
  check_dependencies =
      proc do |plugin, version|
        begin
          current_plugin.requires_redmine_plugin(plugin, version)
        rescue Redmine::PluginNotFound
          raise Redmine::PluginNotFound,
                "Vhod Change User depends on plugin: #{plugin} version: #{version}"
        end
      end
  test_dependencies.each(&check_dependencies)
end