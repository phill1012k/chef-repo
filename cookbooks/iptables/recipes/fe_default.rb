# Cookbook Name:: iptables for FE Servers


package "iptables-persistent" do
  action :install
end

template "/etc/iptables/rules.v4" do
    source "rules.v4.fe.erb"
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

service "iptables-persistent" do
  action [:enable, :start]
end
