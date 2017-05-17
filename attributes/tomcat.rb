default['tomcat']['tar']['url'] = 'http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.59/bin/apache-tomcat-7.0.59.tar.gz'
# Note: Checksum is SHA-256, not MD5 or SHA1. Generate using `shasum -a 256 /path/to/tomcat.tar.gz`
default['tomcat']['tar']['checksum'] = 'e0fe43d1fa17013bf7b3b2d3f71105d606a0582c153eb16fb210e7d5164941b0'
default['tomcat']['tar']['version'] = '7.0.59'

# Tomcat attributes for base instance
default['tomcat']['port'] = node['appserver']['port']
default['tomcat']['proxy_port'] = nil
default['tomcat']['ssl_port'] = 8443
default['tomcat']['ssl_proxy_port'] = nil
default['tomcat']['ssl_enabled'] = node['appserver']['ssl_enabled']
default['tomcat']['ssl_max_threads'] = 150
default['tomcat']['server'] = 'Alfresco Server'


default['tomcat']['base_version'] = 7
default['tomcat']['single_instance'] = 'alfresco'
default['tomcat']['user'] = node['appserver']['user']
default['tomcat']['group'] = node['appserver']['group']

