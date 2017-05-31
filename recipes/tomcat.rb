
include_recipe 'alfresco-utils::java'

install_name = node['appserver']['aps']['installname']
service_name = node['tomcat']['service']
name = [install_name, service_name].join('-')

# umask = node['tomcat']['umask']
# setenv_options = ["export JAVA_OPTS=\"#{node['tomcat']['java_options'].map { |_k, v| v }.join(' ')}\""]
# setenv_options.push("umask #{umask}") unless umask.to_s.empty?

apache_tomcat install_name do
  url node['tomcat']['tar']['url']
  checksum node['tomcat']['tar']['checksum']
  version node['tomcat']['tar']['version']
  instance_root node['appserver']['home']
  catalina_home node['appserver']['home']
  preserve_bundle_wars false

  apache_tomcat_instance service_name do
    single_instance true
    apache_tomcat_service service_name
  end
end

service name do
  action :stop
end
