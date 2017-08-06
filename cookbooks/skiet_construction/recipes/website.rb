#
# Cookbook:: skiet_construction
# Recipe:: website
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Brings down docker mysql image
docker_image "mysql_image" do
  repo 'library/mysql'
  tag '5.7.19'
  source '/src/myproject/container1/Dockerfile'
  action :pull
end

# Creates an instance 'website_mysql_instance' for "Skiet Construction's" website
docker_container 'dbsrv' do
  repo 'library/mysql'
  tag '5.7.19'
  port '3306:3306'
  env ['MYSQL_ROOT_PASSWORD=skdbpsswd']
  volumes ['/usr/local/share/skiet_construction/mysql:/var/lib/mysql']
  action :run
end

# Brings down docker glassfish image
docker_image "glassfish_image" do
  repo 'oracle/glassfish'
  tag '4.1.1'
  action :pull
end

# Creates an instance 'website_glassfish_instance' for "Skiet Construction's" website
docker_container 'gfsrv' do
  repo 'oracle/glassfish'
  tag '4.1.1'
  port ['8080:8080','8181:8181','4848:4848']
  links ['dbsrv:gfsrv']
  action :run
end

# Brings down docker httpd image
docker_image "httpd_image" do
  repo 'library/httpd'
  tag '2.4.27'
  action :pull
end

# Creating local directory on Docker host for glassfish
directory "#{node['docker']['host_data_dir']}/glassfish" do
    mode '0755'
    recursive true
end

template "#{node['docker']['host_data_dir']}/glassfish/httpd.conf" do
  source "apache2_httpd.erb"
end

# Creates an instance 'website_httpd_instance' for "Skiet Construction's" website
docker_container 'wbsrv' do
  repo 'library/httpd'
  tag '2.4.27'
  port '80:80'
  volumes ["#{node['docker']['host_data_dir']}/glassfish/httpd.conf:/usr/local/apache2/conf/httpd.conf"]
  links ['gfsrv:wbsrv']
  action :run
end
