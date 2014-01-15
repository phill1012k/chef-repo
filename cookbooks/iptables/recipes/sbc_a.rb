
SBC1hostname = node["ha"]["SBC1hostname"]
SBC2hostname = node["ha"]["SBC2hostname"]

externalInterfaceName = node["kamailio"]["externalInterfaceName"]
internalInterfaceName = node["kamailio"]["internalInterfaceName"]


 if node["kamailio"].has_key? "SBC1InternalIP" and node["kamailio"].has_key? "SBC1ExternalIP"
    Chef::Log.info('iptables:Using SBC1InternalIP & SBC1ExternalIP attribute')
	SBC1InternalIP = node["kamailio"]["SBC1InternalIP"]
	SBC1ExternalIP = node["kamailio"]["SBC1ExternalIP"]

	else

	 Chef::Log.info('iptables: Searching for Internal and External IPs for SBC1')
#	SBCNodes1 = search(:node, "role:TSessionBorderController* AND chef_environment:"+node.chef_environment+" AND hostname:"+SBC1hostname+" OR role:SessionBorderController* AND chef_environment:"+node.chef_environment+" AND hostname:"+SBC1hostname)
	SBCNodes1 = search(:node, "hostname:"+SBC1hostname)

	SBCNodes1.each do |sbcNode1|
	SBC1InternalIP=sbcNode1["network"]["interfaces"][internalInterfaceName]["addresses"].select { |address, data| data["family"] == "inet" }[0][0]
	SBC1ExternalIP=sbcNode1["network"]["interfaces"][externalInterfaceName]["addresses"].select { |address, data| data["family"] == "inet" }[0][0]

	Chef::Log.info('iptables:Found SBC1InternalIP='+SBC1InternalIP+' SBC1ExternalIP='+SBC1ExternalIP+' for SBC1')
	end
end

 if node["kamailio"].has_key? "SBC2InternalIP" and node["kamailio"].has_key? "SBC2ExternalIP"
    Chef::Log.info('iptables:Using SBC2InternalIP & SBC2ExternalIP attribute')
	SBC2InternalIP = node["kamailio"]["SBC2InternalIP"]
	SBC2ExternalIP = node["kamailio"]["SBC2ExternalIP"]
	else

	 Chef::Log.info('iptables:Searching for Internal and External IPs for SBC2')
	#SBCNodes2 = search(:node, "role:TSessionBorderController* AND chef_environment:"+node.chef_environment+" AND hostname:"+SBC2hostname+" OR role:SessionBorderController* AND chef_environment:"+node.chef_environment+" AND hostname:"+SBC2hostname)
	SBCNodes2 = search(:node, "hostname:"+SBC2hostname)
	SBCNodes2.each do |sbcNode2|
	SBC2InternalIP=sbcNode2["network"]["interfaces"][internalInterfaceName]["addresses"].select { |address, data| data["family"] == "inet" }[0][0]
	SBC2ExternalIP=sbcNode2["network"]["interfaces"][externalInterfaceName]["addresses"].select { |address, data| data["family"] == "inet" }[0][0]

	Chef::Log.info('iptables:Found SBC2InternalIP='+SBC2InternalIP+' SBC2ExternalIP='+SBC2ExternalIP+'  for SBC2')
	end
end


#cookbook_file "/etc/iptables/sbc_a" do
#	source "s1sbc_a"
#	owner 'root'
#	group 'root'
#	mode '0700'
#end

#execute "/etc/iptables/sbc_a" do
#	command "bash /etc/iptables/sbc_a"
#	action :run
#end

template "/etc/init.d/sbc_a" do
	source "sbc_a.erb"
	owner 'root'
    group 'root'
    mode '0700'
	  variables(
		:SBC1InternalIP=>SBC1InternalIP,
		:SBC2InternalIP=>SBC2InternalIP,
		:SBC1ExternalIP=>SBC1ExternalIP,
		:SBC2ExternalIP=>SBC2ExternalIP
  )
end


execute "update-rc.d sbc_a defaults 98 02" do
        command "update-rc.d sbc_a defaults 98 02"
        action :run
end


execute "/etc/init.d/sbc_a" do
        command "/etc/init.d/sbc_a"
        action :run
        ignore_failure true
end

