#
# Cookbook:: aps-appserver
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

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

  it 'includes the `tomcat` recipe' do
    expect(chef_run).to include_recipe('aps-appserver::tomcat')
  end
end
