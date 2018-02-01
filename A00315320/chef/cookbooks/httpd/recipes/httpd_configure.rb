service 'httpd' do
  action [ :enable, :start]
end 

cookbook_file '/var/www/html/index.html' do
  source 'index.html'
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end

template '/var/www/html/welcome.html' do
	source 'welcome.erb'
	mode 0644
	owner 'vagrant'
	group 'vagrant'
	variables(
		:name => node[:name]
	)
end
