#cookbook_file "/etc/iptables/sbc_a" do
#	source "s2sbc_a"
#	owner 'root'
#	group 'root'
#	mode '0700'
#end

#execute "/etc/iptables/sbc_a" do
#	command "bash /etc/iptables/sbc_a"
#	action :run
#end

cookbook_file "/etc/init.d/s2sbc_a" do
        source "s2sbc_a"
        owner 'root'
        group 'root'
        mode '0700'
end

execute "update-rc.d s2sbc_a defaults 98 02" do
        command "update-rc.d s2sbc_a defaults 98 02"
        action :run
end


execute "/etc/init.d/s2sbc_a" do
        command "/etc/init.d/s2sbc_a"
        action :run
        ignore_failure true
end
