control 'aps-appserver-12' do
  impact 0.7
  desc 'Checks Tomcat-activiti service running'

  describe service('tomcat-activiti') do
    it { should be_installed }
    it { should be_enabled }
    it { should_not be_running }
  end
end
