class base::variables {

	$localvar = "local variable"
	# give error $localvar = "new value"
	$topscope = "new top scope value"

	notify { "${topscope} is your topscope variable": }
	notify { "${::topscope} is your topscope variable": }

	notify { "${nodescope} is your nodescope variable": }
	notify { "${localvar} is your local var variable": }
	notify { "${::operatingsystem} is your operating system":}


	file { '/root/var_test.txt':
			content => $topscope,
			owner   => 'root',
			group   => 'root',
			mode    => '0644',
	}


}