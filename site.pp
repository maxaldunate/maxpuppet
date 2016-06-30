$topscope = "This is from our site.pp file"

node default {

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