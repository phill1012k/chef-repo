#cookbook_file "/etc/iptables/rabbitmq" do
#	source "sim"
#	owner 'root'
#	group 'root'
#	mode '0700'
#end

#execute "/etc/iptables/rabbitmq" do
#	command "bash /etc/iptables/rabbitmq"
#	action :run
#end


cookbook_file "/etc/init.d/rabbitmq" do
        source "rabbitmq"
        owner 'root'
        group 'root'
        mode '0700'
end

execute "update-rc.d rabbitmq defaults 98 02" do
        command "update-rc.d rabbitmq defaults 98 02"
        action :run
end


execute "/etc/init.d/rabbitmq" do
        command "/etc/init.d/rabbitmq"
        action :run
        ignore_failure true
end

