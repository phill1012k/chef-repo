
template "/etc/init.d/smtp" do
	source "smtp.erb"
	owner 'root'
    group 'root'
    mode '0700'
end


execute "update-rc.d sbc_a defaults 98 02" do
        command "update-rc.d smtp defaults 98 02"
        action :run
end


execute "/etc/init.d/smtp" do
        command "/etc/init.d/smtp"
        action :run
        ignore_failure true
end

