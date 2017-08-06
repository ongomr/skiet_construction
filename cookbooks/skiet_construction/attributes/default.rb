#
# Cookbook:: skiet_construction
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Docker Attributes
default['docker']['package_version'] = "17.06.0~ce-0~ubuntu"
default['docker']['package_name'] = "docker-ce"
default['docker']['host_data_dir'] = "/usr/local/share/skiet_construction"
