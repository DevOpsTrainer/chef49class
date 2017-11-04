#
# Cookbook:: 49apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package "httpd" do
	action :install
end

service 'httpd' do
	action [:enable, :start]
end

package 'nmap' do
	action :remove
end

file "/var/www/html/index.html" do
	content 'Hellow World...Thak you!'
	mode '0755'
	owner 'root'
	group 'root'
        #notifies :restart, 'service[httpd]'
end

template "/tmp/web.xml" do 
	source "49batch.erb"
	mode "0775"
end

service 'httpd' do
	subscribes :restart, 'file[/var/www/html/index.html]'
end


