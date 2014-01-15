#cookbook_file "/etc/iptables/s2fs_v" do
#	source "s2fs_v"
#	owner 'root'
#	group 'root'
#	mode '0700'
#end

#execute "/etc/iptables/s2fs_v" do
#	command "bash /etc/iptables/s2fs_v"
#	action :run
#end

cookbook_file "/etc/init.d/s2fs_v" do
        source "s2fs_v"
        owner 'root'
        group 'root'
        mode '0700'
end

execute "update-rc.d s2fs_v defaults 98 02" do
        command "update-rc.d s2fs_v defaults 98 02"
        action :run
end


execute "/etc/init.d/s2fs_v" do
        command "/etc/init.d/s2fs_v"
        action :run
        ignore_failure true
end

