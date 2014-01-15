#cookbook_file "/etc/iptables/rtp_v" do
#	source "rtp_v"
#	owner 'root'
#	group 'root'
#	mode '0700'
#end

#execute "/etc/iptables/rtp_v" do
#	command "bash /etc/iptables/rtp_v"
#	action :run
#end

cookbook_file "/etc/init.d/rtp_v" do
        source "rtp_v"
        owner 'root'
        group 'root'
        mode '0700'
end

execute "update-rc.d rtp_v defaults 98 02" do
        command "update-rc.d rtp_v defaults 98 02"
        action :run
end


execute "/etc/init.d/rtp_v" do
        command "/etc/init.d/rtp_v"
        action :run
        ignore_failure true
end

