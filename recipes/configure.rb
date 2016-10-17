# Cookbook Name:: sbp_emet
# Recipe:: configure
#
# Copyright 2014, Matthijs Wijers
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
#

template "#{node['emet']['config_path']}/emet_protection_rules.xml" do
  source 'emet_protection_rules.xml.erb'
  variables(
    :recipe_file => (__FILE__).to_s.split("cookbooks/")[1],
    :template_file => source.to_s,
    :config => node['emet']
  )
  notifies :run, 'execute[clean_rules]'
  notifies :run, 'execute[import_rules]'
end

execute 'clean_rules' do
  command "\"#{node['emet']['install_path']}emet_conf.exe\" --delete_apps"
  action :nothing
end

execute 'import_rules' do
  command "\"#{node['emet']['install_path']}emet_conf.exe\" --import \"#{node['emet']['config_path']}/emet_protection_rules.xml\""
  action :nothing
end
