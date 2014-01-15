#cookbook_file "/etc/iptables/mon" do
#	source "mon"
#	owner 'root'
#	group 'root'
#	mode '0700'
#end

#execute "/etc/iptables/mon" do
#	command "bash /etc/iptables/mon"
#	action :run
#end

cookbook_file "/etc/init.d/mon" do
        source "mon"
        owner 'root'
        group 'root'
        mode '0700'
end

execute "update-rc.d mon defaults 98 02" do
        command "update-rc.d mon defaults 98 02"
        action :run
end


execute "/etc/init.d/mon" do
        command "/etc/init.d/mon"
        action :run
        ignore_failure true
end

