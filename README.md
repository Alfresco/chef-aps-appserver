# chef-aps-appserver cookbook
[![Build Status](https://travis-ci.org/Alfresco/chef-aps-appserver.svg)](https://travis-ci.com/Alfresco/chef-aps-appserver?branch=master)

This cookbook will install the Application Server part of the Alfresco Process Services, [chef-aps](https://github.com/alfresco/chef-aps).
The default choice is Tomcat, but it can be expanded to use your own application server.

## Requirements

### Cookbooks

The following cookbooks are direct dependencies because they're used for common "default" functionality.

- [`apache_tomcat`](https://github.com/Alfresco/chef-apache_tomcat) for Tomcat installation
- [`poise-derived`](https://github.com/poise/poise-derived) for defining lazily evaluated node attributes
- [`alfresco-utils`](https://github.com/Alfresco/chef-alfresco-utils) Chef utilities used by Chef-aps

### Platforms

The following platforms are supported and tested with Test Kitchen:

- CentOS 7+

### Chef

- Chef 12.1+

## Attributes

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| default['appserver']['engine'] | String | Engine of choice  | tomcat  |
| default['appserver']['installname'] | String | installname of choice  | tomcat  |
| default['appserver']['username'] | String   | Appserver user |  tomcat |
| default['appserver']['group']  | String   | Appserver group |  tomcat |
| default['appserver']['username'] | String   | Appserver user |  tomcat |
| default['appserver']['home']  | String   | catalina_home |  /usr/share/tomcat |

other specific Tomcat Attributes

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| default['tomcat']['tar']['url'] | String | URL for the installation |[`installation_url`](http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.36/bin/apache-tomcat-8.0.36.tar.gz) 
| default['tomcat']['tar']['version'] | String | Tomcat version | 8.0.36
| default['tomcat']['service'] | String | Tomcat service name | activiti

## Usage

Just add the reference of this cookbook inside your `metadata.rb` file:

```
depends 'aps-appserver', '~> v0.1'
```

Main recipe is:

- `aps-appserver::default` will install the Application Server of your choice ( specified under the `default['appserver']['engine']` attribute)

Include `aps-appserver` in your node `run_list`:

```json
{
  "run_list": [
    "recipe[aps-appserver:default]"
  ]
}
```
## Testing
Refer to: [Testing](./TESTING.md)
## License and Authors

- Author:: Juena Ferdous (<juena.ferdous@alfresco.com>)

```text
Copyright 2017, Alfresco

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
```


