default['appserver']['alfresco']['home'] = '/usr/share/tomcat'

default['appserver']['engine'] = 'tomcat'
default['appserver']['user'] = node['appserver']['engine']
default['appserver']['group'] = node['appserver']['engine']
default['appserver']['install_java'] = false
default['appserver']['install_maven'] = false
default['appserver']['port'] = 8080
default['appserver']['ssl_enabled'] = true
default['appserver']['run_single_instance'] = false