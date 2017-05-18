
include_recipe 'alfresco-utils::java'

install_name = node['appserver']['aps']['home'].split('/').last
service_name = node['tomcat']['service']
name = [install_name, service_name].join('-')

apache_tomcat install_name do
  url node['tomcat']['tar']['url']
  checksum node['tomcat']['tar']['checksum']
  version node['tomcat']['tar']['version']

  apache_tomcat_instance 'activiti' do
    apache_tomcat_service service_name
  end
end

service name do
  action :stop
end

