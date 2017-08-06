#
# Cookbook:: skiet_construction
# Recipe:: mailinabox
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Brings down docker ubuntu-14.04 image
docker_image "mailinabox_ubuntu_image" do
  repo 'library/ubuntu'
  tag 'trusty'
  action :pull
end

# Creates an instance 'mailinabox_ubuntu_instance' for "mail in a box" install
docker_container 'mbsrv' do
  repo 'library/ubuntu'
  tag 'trusty'
  port ['25:25','53:53/tcp','53:53/udp','443:443','587:587','993:993','995:995','4190:4190'] # '22:22''80:80'
  volumes ["#{node['docker']['host_data_dir']}/mailinabox/user-data:/home/user-data"]
  tty true
  action :run
end
