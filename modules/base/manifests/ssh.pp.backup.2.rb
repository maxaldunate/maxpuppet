class base::ssh {
	package {'openssh-package':
		name   => 'openssh-server',
		ensure => present,
		before => File['sshd-config'],
	}

	file {'sshd-config':
		name    => '/etc/ssh/sshd_config',
		ensure  => file,
		owner   => 'root',
		group   => 'root',
		source  => 'puppet:///modules/base/sshd_config',
		notify  => Service['sshd']
	}

	service {'sshd':
		name      => 'sshd',
		ensure    => running,
		enable    => true,
	}
}