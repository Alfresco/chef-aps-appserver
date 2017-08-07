control 'aps-appserver-12' do
  impact 0.7
  desc 'Checks Tomcat-activiti service running'

  describe service('tomcat-activiti') do
    it { should be_installed }
    it { should be_enabled }
    it { should_not be_running }
  end

  describe file('/usr/share/tomcat/conf/server.xml') do
    it { should exist }
    it { should be_file }
    its('content') { should include('shutdown="CHANGEME"') }
    its('content') { should include('proxyPort="443"') }
    its('content') { should include('proxyName="test.alfresco.com"') }
    its('content') { should include('scheme="https"') }
    its('content') { should include('secure="true"') }
  end
end
