class base {
	$dns-utility = $osfamily ? {
		'Redhat' => 'bind-utils',
		'Debian' => 'dns-utils',
	}

	package { ['tree',$dns-utility]:
		ensure => present,
	}
}