#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'ntp'
time_server = node["time_server"]["time_server"]
template '/etc/ntp.conf' do
  source    'ntp.conf.erb'
  variables(
	:time_server => time_server
	)
  notifies  :restart, 'service[ntp]'
end
service 'ntp' do
  action [:enable, :start]
end
