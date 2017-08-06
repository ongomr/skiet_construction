#
# Cookbook:: skiet_construction
# Recipe:: install_docker
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Installs and starts docker as a service
docker_service 'default' do
  action [:create, :start]
end

# Creating local directory on Docker host  
directory node['docker']['host_data_dir'] do
    mode '0755'
    recursive true
end
