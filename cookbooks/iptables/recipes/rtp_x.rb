#cookbook_file "/etc/iptables/rtp_x" do
#	source "rtp_x"
#	owner 'root'
#	group 'root'
#	mode '0700'
#end

#execute "/etc/iptables/rtp_x" do
#	command "bash /etc/iptables/rtp_x"
#	action :run
#end

cookbook_file "/etc/init.d/rtp_x" do
        source "rtp_x"
        owner 'root'
        group 'root'
        mode '0700'
end

execute "update-rc.d rtp_x defaults 98 02" do
        command "update-rc.d rtp_x defaults 98 02"
        action :run
end


execute "/etc/init.d/rtp_x" do
        command "/etc/init.d/rtp_x"
        action :run
        ignore_failure true
end

