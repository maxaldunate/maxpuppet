class ntp (
	$package = $package
	) inherits ntp::params {

	package { 'ntp':
			name   => $package,
			ensure => present,
	}

	notify {"The variable package is equal to ${package}": }

	class {'ntp::file': template => 'ntp_centos.conf',}
	include ntp::service

}