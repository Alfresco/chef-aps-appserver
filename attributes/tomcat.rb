default['tomcat']['tar']['url'] = 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.36/bin/apache-tomcat-8.0.36.tar.gz'
default['tomcat']['tar']['checksum'] = '7963464d86faf8416b92fb2b04c70da9759c7c332e1700c1e9f581883b4db664'
default['tomcat']['tar']['version'] = '8.0.36'
default['tomcat']['service'] = 'activiti'
default['tomcat']['java_options']['log_paths'] = lazy { "-Dlog4j.configuration=file:#{node['appserver']['home']}/conf/log4j.properties -Xloggc:#{node['appserver']['home']}/logs/gc.log -XX:ErrorFile=#{node['appserver']['home']}/logs/jvm_crash%p.log -XX:HeapDumpPath=#{node['appserver']['home']}/logs/" }

default['tomcat']['jmxremote_port'] = '9010'
default['tomcat']['jmxremote_path'] = lazy { "#{node['appserver']['home']}/conf" }
default['tomcat']['jmxremote_access_filename'] = 'jmxremote.access'
default['tomcat']['jmxremote_password_filename'] = 'jmxremote.password'
jmxremote_access_fullpath = lazy { "#{node['tomcat']['jmxremote_path']}/#{node['tomcat']['jmxremote_access_filename']}" }
jmxremote_password_fullpath = lazy { "#{node['tomcat']['jmxremote_path']}/#{node['tomcat']['jmxremote_password_filename']}" }

default['tomcat']['java_options']['jmx'] = lazy { "-Dcom.sun.management.jmxremote.port=#{node['tomcat']['jmxremote_port']} -Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.authenticate=true -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.access.file=#{jmxremote_access_fullpath} -Dcom.sun.management.jmxremote.password.file=#{jmxremote_password_fullpath} -Dcom.sun.management.jmxremote.local.only=false" }

default['tomcat']['proxy_port'] = nil 
default['tomcat']['proxy_name'] = nil
default['tomcat']['ssl_enabled'] = false
default['tomcat']['scheme'] = nil
