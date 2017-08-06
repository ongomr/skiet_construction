#
# Cookbook:: skiet_construction
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe "apt::default"
include_recipe "chef-apt-docker::default"
include_recipe "skiet_construction::install_docker"
include_recipe "skiet_construction::mailinabox"
include_recipe "skiet_construction::website"
