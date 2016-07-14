class hosts::file {

	#puppet resource names are CASE sensitive
	
	#error situation. one file twice, not possible
	#file {'motd1':
	#	path    => '/etc/motd',
	#	content => 'Welcome to my server',
	#}


	file {'motd2':
		path    => '/etc/motd',
		content => 'Welcome to my server 2',
	}

	#no error in this case, other resource type
	package {'motd2':
		name    => 'httpd',
	}

}