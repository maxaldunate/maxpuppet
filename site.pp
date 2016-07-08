## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
File { backup => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
}

$topscope = "This is from our site.pp file"

node default {

}

node classparameters {
	include pe_repo::platform::ubuntu_14004_amd64
	$package = "node scope variable"
	class { 'ntp':  }
	include ntp:service
}

node "maxaldunate2.mylabserver.com" {
	include pe_repo::platform::ubuntu_14004_amd64
}

node /^maxaldunate\d{1}.mylabserver.com$/ {
	$nodescope = "defined within our node"
	include localusers
	include localusers::groups::finance
	include localusers::groups::wheel
	include base
	include base::params
	include base::ssh
	include base::variables
}

node /^puppetagent.\*$/ {
	include roles::webserver
}

node puppetagent {
	include base
	include base::params
	include base::variables
	class { 'ntp': package => 'ntp', }
}

node puppetagent.home {
	include base
	include base::params
	include base::variables
}

node puppetagent.mrw.lan {
	include base
	include base::params
	include base::variables
}

node ansible1 {
	include base
	include base::params
	include base::variables
}

# puppet apply --modulepath=/etc/puppetlabs/code/environments/production/modules -e "include base include base::params include base::variables"