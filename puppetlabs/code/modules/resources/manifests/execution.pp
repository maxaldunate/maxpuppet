class resources::execution {
	
	exec {'addLineToHosts':
		command => "/bin/echo '10.0.2.1 webserver01 #mywebserver' >> /etc/hosts",
		path    => "/usr/bin:/usr/sbin:/bin",
		onlyif  => 'test -z $(grep "10.0.2.1 webserver01" /etc/hosts)', 
		#unless  => " 'test ! -v $(grep "10.0.2.1 webserver01" /etc/hosts)'"
	}
}