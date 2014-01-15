
SBC1hostname = node["ha"]["SBC1hostname"]
SBC2hostname = node["ha"]["SBC2hostname"]

externalInterfaceName = node["kamailio"]["externalInterfaceName"]
internalInterfaceName = node["kamailio"]["internalInterfaceName"]
MPLSInterfaceName = node["kamailio"]["MPLSInterfaceName"]
AIRBNBInterfaceName = node["kamailio"]["AIRBNBInterfaceName"]


 if node["kamailio"].has_key? "SBC1InternalIP" and node["kamailio"].has_key? "SBC1ExternalIP"
    Chef::Log.info('Using SBC1InternalIP & SBC1ExternalIP attribute')
	SBC1InternalIP = node["kamailio"]["SBC1InternalIP"]
	SBC1ExternalIP = node["kamailio"]["SBC1ExternalIP"]
	SBC1MPLSIP = node["kamailio"]["SBC1MPLSIP"]
	SBC1AIRBNBIP = node["kamailio"]["SBC1AIRBNBIP"]
	else

	 Chef::Log.info('Searching for Internal and External IPs for SBC1')
#	SBCNodes1 = search(:node, "role:TSessionBorderController* AND chef_environment:"+node.chef_environment+" AND hostname:"+SBC1hostname+" OR role:SessionBorderController* AND chef_environment:"+node.chef_environment+" AND hostname:"+SBC1hostname)
	SBCNodes1 = search(:node, "hostname:"+SBC1hostname)

	SBCNodes1.each do |sbcNode1|
	SBC1InternalIP=sbcNode1["network"]["interfaces"][internalInterfaceName]["addresses"].select { |address, data| data["family"] == "inet" }[0][0]
	SBC1ExternalIP=sbcNode1["network"]["interfaces"][externalInterfaceName]["addresses"].select { |address, data| data["family"] == "inet" }[0][0]
    SBC1MPLSIP=sbcNode1["network"]["interfaces"][MPLSInterfaceName]["addresses"].select { |address, data| data["family"] == "inet" }[0][0]
    SBC1AIRBNBIP=sbcNode1["network"]["interfaces"][AIRBNBInterfaceName]["addresses"].select { |address, data| data["family"] == "inet" }[0][0]		
	Chef::Log.info('Found SBC1InternalIP='+SBC1InternalIP+' SBC1ExternalIP='+SBC1ExternalIP+' SBC1MPLSIP='+SBC1MPLSIP+' for SBC1')
	end
end

 if node["kamailio"].has_key? "SBC2InternalIP" and node["kamailio"].has_key? "SBC2ExternalIP"
    Chef::Log.info('Using SBC2InternalIP & SBC2ExternalIP attribute')
	SBC2InternalIP = node["kamailio"]["SBC2InternalIP"]
	SBC2ExternalIP = node["kamailio"]["SBC2ExternalIP"]
	SBC2MPLSIP = node["kamailio"]["SBC2MPLSIP"]
	SBC2AIRBNBIP = node["kamailio"]["SBC2AIRBNBIP"]
	else

	 Chef::Log.info('Searching for Internal and External IPs for SBC2')
	#SBCNodes2 = search(:node, "role:TSessionBorderController* AND chef_environment:"+node.chef_environment+" AND hostname:"+SBC2hostname+" OR role:SessionBorderController* AND chef_environment:"+node.chef_environment+" AND hostname:"+SBC2hostname)
	SBCNodes2 = search(:node, "hostname:"+SBC2hostname)
	SBCNodes2.each do |sbcNode2|
	SBC2InternalIP=sbcNode2["network"]["interfaces"][internalInterfaceName]["addresses"].select { |address, data| data["family"] == "inet" }[0][0]
	SBC2ExternalIP=sbcNode2["network"]["interfaces"][externalInterfaceName]["addresses"].select { |address, data| data["family"] == "inet" }[0][0]
	SBC2MPLSIP=sbcNode2["network"]["interfaces"][MPLSInterfaceName]["addresses"].select { |address, data| data["family"] == "inet" }[0][0]
    SBC2AIRBNBIP=sbcNode2["network"]["interfaces"][AIRBNBInterfaceName]["addresses"].select { |address, data| data["family"] == "inet" }[0][0]	
	Chef::Log.info('Found SBC2InternalIP='+SBC2InternalIP+' SBC2ExternalIP='+SBC2ExternalIP+' SBC2MPLSIP='+SBC2MPLSIP+' for SBC2')
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

template "/etc/init.d/sbc_t" do
	source "sbc_t.erb"
	owner 'root'
    group 'root'
    mode '0700'
	  variables(
		:SBC1InternalIP=>SBC1InternalIP,
		:SBC2InternalIP=>SBC2InternalIP,
		:SBC1ExternalIP=>SBC1ExternalIP,
		:SBC2ExternalIP=>SBC2ExternalIP,
		:SBC1MPLSIP=>SBC1MPLSIP,
		:SBC2MPLSIP=>SBC2MPLSIP,
		:SBC1AIRBNBIP=>SBC1AIRBNBIP,
		:SBC2AIRBNBIP=>SBC2AIRBNBIP
  )
end


execute "update-rc.d sbc_t defaults 98 02" do
        command "update-rc.d sbc_t defaults 98 02"
        action :run
end


execute "/etc/init.d/sbc_t" do
        command "/etc/init.d/sbc_t"
        action :run
        ignore_failure true
end

