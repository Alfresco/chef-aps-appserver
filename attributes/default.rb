# appserver specific attributes
default['appserver']['engine'] = 'tomcat'
default['appserver']['installname'] = 'tomcat'
default['appserver']['username'] = 'tomcat'
default['appserver']['group'] = 'tomcat'
default['appserver']['home'] = '/usr/share/tomcat'

default['appserver']['jmxremote_databag'] = 'credentials'
default['appserver']['jmxremote_databag_items'] = %w(systemsmonitor systemscontrol)
