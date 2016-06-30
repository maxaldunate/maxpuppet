class base::ssh {

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
		name      => $base::params::ssh_name,
		ensure    => running,
		alias     => 'ssh-service-name-two',
		enable    => true,
	}
}