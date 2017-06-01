require 'spec_helper'
require 'chefspec'

RSpec.describe 'aps-appserver::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
      platform: 'centos',
      version: '7.2.1511',
      file_cache_path: '/var/chef/cache'
    ) do |node|
    end.converge(described_recipe)
  end

  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end

  it 'should include alfresco-utils::java recipe' do
    expect(chef_run).to include_recipe('alfresco-utils::java')
  end

  it 'installs apache_tomcat' do
    expect(chef_run).to install_apache_tomcat('tomcat').with(
      version: '8.0.36'
    )
  end

  it 'installs apache_tomcat' do
    expect(chef_run).to create_apache_tomcat_instance('activiti')
  end

  it 'stops tomcat' do
    expect(chef_run).to stop_service('tomcat-activiti')
  end
end
