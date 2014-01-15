#cookbook_file "/etc/iptables/fs_x" do
#	source "fs_x"
#	owner 'root'
#	group 'root'
#	mode '0700'
#end
#
#execute "/etc/iptables/fs_x" do
#	command "bash /etc/iptables/fs_x"
#	action :run
#end

cookbook_file "/etc/init.d/fs_x" do
        source "fs_x"
        owner 'root'
        group 'root'
        mode '0700'
end

execute "update-rc.d fs_x defaults 98 02" do
        command "update-rc.d fs_x defaults 98 02"
        action :run
end


execute "/etc/init.d/fs_x" do
        command "/etc/init.d/fs_x"
        action :run
        ignore_failure true
end
