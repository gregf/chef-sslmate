#
# Cookbook Name:: sslmate
# Recipe:: _install_source
#
# Copyright 2014, Greg Fitzgerald
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

sslmate_tar = filename_from_url node['sslmate']['url']

node['sslmate']['install_depends'].each do |pkg|
  package pkg
end

remote_file 'download sslmate' do
  path "#{Chef::Config[:file_cache_path]}/#{sslmate_tar}"
  source node['sslmate']['url']
  mode 00644
  owner 'root'
  group 'root'
  notifies :run, 'bash[extract_sslmate]'
  only_if { ! ::File.exist?("#{Chef::Config[:file_cache_path]}/#{sslmate_tar}") }
end

bash 'extract_sslmate' do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
  mkdir sslmate-source
  tar -xf #{sslmate_tar} -C sslmate-source --strip-components=1
  EOH
  notifies :run, 'bash[install_sslmate]'
  action :nothing
end

bash 'install_sslmate' do
  cwd "#{Chef::Config[:file_cache_path]}/sslmate-source"
  code <<-EOH
    make install
  EOH
  action :nothing
end


