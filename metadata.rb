name 'aps-appserver'
maintainer 'Alfresco T&A Team'
maintainer_email 'devops@alfresco.com'
license 'Apache 2.0'
description 'Installs/Configures aps-appserver'
long_description 'Installs/Configures aps-appserver'
version '0.1.1'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/Alfresco/chef-aps-appserver/issues'

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/Alfresco/chef-aps-appserver'

chef_version '~> 12.19.36'
supports 'centos', '>= 7.0'

depends 'apache_tomcat'
depends 'poise-derived', '~> 1.0.0'
depends 'alfresco-utils', '~> 1.0'
