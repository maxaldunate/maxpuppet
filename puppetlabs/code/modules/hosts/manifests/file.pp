class hosts::file {
	
	#error situation. one file twice, not possible

	file {'motd1':
		path    => '/etc/motd',
		content => 'Welcome to my server',
	}

	file {'motd2':
		path    => '/etc/motd',
		content => 'Welcome to my server 2',
	}

}