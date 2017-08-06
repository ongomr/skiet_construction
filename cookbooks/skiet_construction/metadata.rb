name 'skiet_construction'
maintainer 'Robert Ongom'
maintainer_email 'RobertOngom@gmail.com'
license ''
description 'Installs/Configures skiet_construction'
long_description 'Installs/Configures skiet_construction'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'apt', '~> 6.1.3'
depends 'docker', '~> 2.15.18'
depends 'chef-apt-docker', '~> 2.0.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/skiet_construction/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/skiet_construction'
