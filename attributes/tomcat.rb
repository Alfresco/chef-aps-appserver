default['tomcat']['tar']['url'] = 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.36/bin/apache-tomcat-8.0.36.tar.gz'
default['tomcat']['tar']['checksum'] = '7963464d86faf8416b92fb2b04c70da9759c7c332e1700c1e9f581883b4db664'
default['tomcat']['tar']['version'] = '8.0.36'
default['tomcat']['service'] = 'activiti'
default['tomcat']['java_options']['log_paths'] = lazy { "-Dlog4j.configuration=file:#{node['appserver']['home']}/conf/log4j.properties -Xloggc:#{node['appserver']['home']}/logs/gc.log -XX:ErrorFile=#{node['appserver']['home']}/logs/jvm_crash%p.log -XX:HeapDumpPath=#{node['appserver']['home']}/logs/" }
