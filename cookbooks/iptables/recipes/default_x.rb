# Cookbook Name:: iptables
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "iptables-persistent" do
  action :install
end

template "/etc/iptables/rules.v4" do
    source "rules_x.v4.erb"
end

service "iptables-persistent" do
  action [:enable, :start]
end

cookbook_file "/etc/iptables/firewall.down" do
        source "firewall.down"
        owner 'root'
        group 'root'
        mode '0700'
end

cookbook_file "/etc/iptables/enable.logging" do
        source "enable.logging"
        owner 'root'
        group 'root'
        mode '0700'
end
