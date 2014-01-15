#cookbook_file "/etc/iptables/mgmt" do
#	source "mgmt"
#	owner 'root'
#	group 'root'
#	mode '0700'
#end

#execute "/etc/iptables/mgmt" do
#	command "bash /etc/iptables/mgmt"
#	action :run
#end

cookbook_file "/etc/init.d/mgmt" do
        source "mgmt"
        owner 'root'
        group 'root'
        mode '0700'
end

execute "update-rc.d mgmt defaults 98 02" do
        command "update-rc.d mgmt defaults 98 02"
        action :run
end


execute "/etc/init.d/mgmt" do
        command "/etc/init.d/mgmt"
        action :run
        ignore_failure true
end

