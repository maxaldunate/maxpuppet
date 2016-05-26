class base::ssh {

	case $osfamily {
		'RedHat': {$ssh_name = 'sshd'}
		'Debian': {$ssh_name = 'ssh'}
		defaul: {fail('OS not support by puppet module SSH')}
	}

	# $ssh_name = $osfamily ? {
	# 	'RedHat' => 'sshd',
	# 	'Debian' => 'ssh',
	# 	default  => 'value',
	# }
	
	package {'openssh-package':
		name   => 'openssh-server',
		ensure => present,
	}

	file {'sshd-config':
		name    => '/etc/ssh/sshd_config',
		ensure  => file,
		owner   => 'root',
		group   => 'root',
		source  => 'puppet:///modules/base/sshd_config',
		require => Package['openssh-package'],
		notify  => Service['ssh-service-name-two'],
	}

	service {'ssh-service':
		name      => $ssh_name,
		ensure    => running,
		alias     => 'ssh-service-name-two',
		enable    => true,
	}
}