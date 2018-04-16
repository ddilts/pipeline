#
# Cookbook Name:: pipeline
# Recipe:: knife
#
# Copyright 2014, Stephen Lauck <lauck@getchef.com>
# Copyright 2014, Chef, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
cookbook_name = 'pipeline'
jenkins_cb_name = node[cookbook_name]['jenkins_cb_name']

directory node[jenkins_cb_name]['master']['home'] + '/.chef' do
  owner node[jenkins_cb_name]['master']['user']
  group node[jenkins_cb_name]['master']['user']
  mode '0755'
end

# search data bag chef_orgs for each chef server or org
# write out knife and pem
chef_orgs.each do |org|
  template node[jenkins_cb_name]['master']['home'] + '/.chef/knife.rb' do
    cookbook cookbook_name
    source 'knife.rb.erb'
    owner node[jenkins_cb_name]['master']['user']
    group node[jenkins_cb_name]['master']['group']
    mode '0644'
    variables(
      chef_server_url: org['chef_server_url'],
      client_node_name: org['client']
    )
  end

  file node[jenkins_cb_name]['master']['home'] + '/.chef/' + org['client'] + '.pem' do
    content org['pem']
    owner node[jenkins_cb_name]['master']['user']
    group node[jenkins_cb_name]['master']['group']
    mode '0644'
  end
end
