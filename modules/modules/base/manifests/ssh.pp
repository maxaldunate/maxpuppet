class base::ssh {
	package {'openssh-package':
		name   => 'openssh',
		ensure => present,
	}

	file {'sshd-config':
		name    => '/etc/ssh/sshd_config',
		ensure  => file,
		owner   => 'root',
		group   => 'root',
		require => Package['openssh-package'],
		source  => 'puppet:///modules/base/sshd_config',
	}

	service {'sshd':
		name      => 'sshd',
		ensure    => running,
		enable    => true,
		subscribe => File['sshd-config'],
	}
}