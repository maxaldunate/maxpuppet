class resources::hosts {

	#host {'webserver01':
	#	name         => 'webserver01.mylabserver.com',
	#	ip   	     => '10.1.1.1',
	#	host_aliases => ['web','webhead01','webserver1'],
	#	comment      => 'This ir our webserver primary',
	#}

	host {'ThinkPadW520':  ip => '192.168.242.1',}
	host {'ununtu1510dev': ip => '192.168.242.200',}
	host {'ansible1':      ip => '192.168.242.201',}
	host {'ansible2':      ip => '192.168.242.202',}
	host {'ansible3':      ip => '192.168.242.203',}
	host {'puppetmaster':  ip => '192.168.242.204',}
	host {'pagCentos7':    ip => '192.168.242.205',}
	host {'pagUbun14':     ip => '192.168.242.206',}

}