class base {
	$dnsutility = $osfamily ? {
		'Redhat' => 'bind-utils',
		'Debian' => 'dns-utils',
	}

	$systemupdate = $osfamily ? {
		'Redhat' => '/usr/bin/yum update -y',
		'Debian' => '/usr/bin/apt-get upgrade -y',
	}	

	package { ['tree', $dnsutility]:
		ensure => present,
	}

	schedule {'system-daily':
		period => daily,
		range  => '15:00 - 19:00',
	}

	exec {$systemupdate :
		schedule => 'system-daily',
	}
}