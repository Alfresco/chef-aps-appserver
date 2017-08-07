
include_recipe 'alfresco-utils::java'

setenv_options = ["export JAVA_OPTS=\"#{node['tomcat']['java_options'].map { |_k, v| v }.join(' ')}\""]

install_name = node['appserver']['installname']
service_name = node['tomcat']['service']
name = [install_name, service_name].join('-')

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
    setenv_options do
      config(setenv_options)
    end
  end

  apache_tomcat_config 'server' do
    options do
      proxy_port node['tomcat']['proxy_port']
      proxy_name node['tomcat']['proxy_name']
      http_scheme node['tomcat']['scheme']
      shutdown_port node['tomcat']['shutdown_port']
    end
    only_if { node['tomcat']['custom_server'] }
  end
end

jmxremote_databag = node['appserver']['jmxremote_databag']
jmxremote_databag_items = node['appserver']['jmxremote_databag_items']

ruby_block 'Setting jxm remote attributes for Tomcat' do
  block do
    begin
      jmxremote_databag_items.each do |jmxremote_databag_item|
        db_item = data_bag_item(jmxremote_databag, jmxremote_databag_item)
        node.default['tomcat']["jmxremote_#{jmxremote_databag_item}_role"] = db_item['username']
        node.default['tomcat']["jmxremote_#{jmxremote_databag_item}_password"] = db_item['password']
        node.default['tomcat']["jmxremote_#{jmxremote_databag_item}_access"] = db_item['access']
      end
    rescue
      Chef::Log.warn("Error fetching databag #{jmxremote_databag},  item #{jmxremote_databag_items}")
    end
  end
  action :run
end

template "#{node['tomcat']['jmxremote_path']}/#{node['tomcat']['jmxremote_access_filename']}" do
  source 'tomcat/jmxremote.access.erb'
  owner node['appserver']['username']
  group node['appserver']['group']
  mode 00750
  variables jmxremote_databag_items: node['appserver']['jmxremote_databag_items']
end

template "#{node['tomcat']['jmxremote_path']}/#{node['tomcat']['jmxremote_password_filename']}" do
  source 'tomcat/jmxremote.password.erb'
  owner node['appserver']['username']
  group node['appserver']['group']
  mode 00600
  variables jmxremote_databag_items: node['appserver']['jmxremote_databag_items']
end

template "#{node['appserver']['home']}/conf/log4j.properties" do
  source 'log4j.properties.erb'
  owner node['appserver']['username']
  group node['appserver']['group']
  mode 00750
  variables properties: node['appserver']['log4j-properties']
end

service name do
  action :stop
end
