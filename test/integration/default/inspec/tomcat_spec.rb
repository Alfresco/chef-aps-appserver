control 'aps-01' do
  impact 0.7
  title 'Tomcat configuration'
  desc 'Checks Tomcat connection'

  describe user('tomcat') do
    it { should exist }
  end

  describe group('tomcat') do
    it { should exist }
  end

  describe service('Tomcat-activiti') do
    it { should_not be_enabled }
    it { should_not be_running }
  end

  describe file('/opt/tomcat/activiti') do
    it { should exist }
    its('owner') { should eq 'tomcat' }
    its('group') { should eq 'tomcat' }
    it { should be_writable.by_user('tomcat') }
    it { should be_readable.by_user('tomcat') }
    it { should be_executable.by_user('tomcat') }
    it { should_not be_readable.by_user('nginx') }
    it { should_not be_writable.by_user('nginx') }
    it { should_not be_executable.by_user('nginx') }
  end

  describe file('/etc/tomcat') do
    it { should exist }
    its('owner') { should eq 'tomcat' }
    its('group') { should eq 'tomcat' }
    it { should be_writable.by_user('tomcat') }
    it { should be_readable.by_user('tomcat') }
    it { should be_executable.by_user('tomcat') }
    it { should_not be_readable.by_user('nginx') }
    it { should_not be_writable.by_user('nginx') }
    it { should_not be_executable.by_user('nginx') }
  end

  describe file('/var/log/tomcat') do
    it { should exist }
    its('owner') { should eq 'tomcat' }
    its('group') { should eq 'tomcat' }
    it { should be_writable.by_user('tomcat') }
    it { should be_readable.by_user('tomcat') }
    it { should be_executable.by_user('tomcat') }
    it { should_not be_readable.by_user('nginx') }
    it { should_not be_writable.by_user('nginx') }
    it { should_not be_executable.by_user('nginx') }
  end

  describe file('/var/lib/tomcat/activiti') do
    it { should exist }
    its('owner') { should eq 'tomcat' }
    its('group') { should eq 'tomcat' }
    it { should be_writable.by_user('tomcat') }
    it { should be_readable.by_user('tomcat') }
    it { should be_executable.by_user('tomcat') }
    it { should_not be_readable.by_user('nginx') }
    it { should_not be_writable.by_user('nginx') }
    it { should_not be_executable.by_user('nginx') }
  end

  describe file('/var/cache/tomcat/activiti') do
    it { should exist }
    its('owner') { should eq 'tomcat' }
    its('group') { should eq 'tomcat' }
    it { should be_writable.by_user('tomcat') }
    it { should be_readable.by_user('tomcat') }
    it { should be_executable.by_user('tomcat') }
    it { should_not be_readable.by_user('nginx') }
    it { should_not be_writable.by_user('nginx') }
    it { should_not be_executable.by_user('nginx') }
  end

  describe file('/opt/tomcat/activiti/bin/setenv.sh') do
    it { should exist }
    its('owner') { should eq 'tomcat' }
    its('group') { should eq 'tomcat' }
    it { should be_writable.by_user('tomcat') }
    it { should be_readable.by_user('tomcat') }
    it { should be_executable.by_user('tomcat') }
    it { should_not be_readable.by_user('nginx') }
    it { should_not be_writable.by_user('nginx') }
    it { should_not be_executable.by_user('nginx') }
  end

  describe file('/opt/tomcat/activiti/conf/web.xml') do
    it { should exist }
    its('owner') { should eq 'tomcat' }
    its('group') { should eq 'tomcat' }
    it { should be_writable.by_user('tomcat') }
    it { should be_readable.by_user('tomcat') }
    it { should_not be_executable.by_user('tomcat') }
    it { should_not be_readable.by_user('nginx') }
    it { should_not be_writable.by_user('nginx') }
    it { should_not be_executable.by_user('nginx') }
    its('content') { should match '<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"' }
  end

  describe file('/opt/tomcat/activiti/conf/context.xml') do
    it { should exist }
    its('owner') { should eq 'tomcat' }
    its('group') { should eq 'tomcat' }
    it { should be_writable.by_user('tomcat') }
    it { should be_readable.by_user('tomcat') }
    it { should_not be_executable.by_user('tomcat') }
    it { should_not be_readable.by_user('nginx') }
    it { should_not be_writable.by_user('nginx') }
    it { should_not be_executable.by_user('nginx') }
  end

  describe file('/etc/systemd/system/tomcat-activiti.service') do
    it { should exist }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    it { should be_writable.by_user('root') }
    it { should be_readable.by_user('root') }
    it { should_not be_executable.by_user('root') }
    it { should_not be_writable.by_user('tomcat') }
    it { should be_readable.by_user('tomcat') }
    it { should_not be_executable.by_user('tomcat') }
    its('content') { should match 'Environment="CATALINA_HOME=/usr/share/tomcat-8.0.36"' }
    its('content') { should match '"CATALINA_BASE=/opt/tomcat/activiti" "JAVA_HOME=/usr"' }
  end
end
