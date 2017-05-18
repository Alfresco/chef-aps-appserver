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
end
