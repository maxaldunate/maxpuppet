class base::params {

	$author = "maxito"

	case $::osfamily {
		'RedHat': {$ssh_name = 'sshd'}
		'Debian': {$ssh_name = 'ssh'}
		defaul: {fail('OS not support by puppet module SSH')}
	}

	# $ssh_name = $osfamily ? {
	# 	'RedHat' => 'sshd',
	# 	'Debian' => 'ssh',
	# 	default  => 'value',
	# }


}
