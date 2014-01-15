#cookbook_file "/etc/iptables/sim" do
#	source "sim"
#	owner 'root'
#	group 'root'
#	mode '0700'
#end

#execute "/etc/iptables/sim" do
#	command "bash /etc/iptables/sim"
#	action :run
#end

cookbook_file "/etc/init.d/sim" do
        source "sim"
        owner 'root'
        group 'root'
        mode '0700'
end

execute "update-rc.d sim defaults 98 02" do
        command "update-rc.d sim defaults 98 02"
        action :run
end


execute "/etc/init.d/sim" do
        command "/etc/init.d/sim"
        action :run
        ignore_failure true
end
