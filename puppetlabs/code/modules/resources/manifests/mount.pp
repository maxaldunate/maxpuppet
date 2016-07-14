class resources::mount {
	
	file {'/content':
		ensure => directory,
	}

	mount {'/content':
		device  => '/dev/sdb',
		fstype  => 'ext2',
		options => 'defaults',
		ensure  => 'mounted',
		require => File['/content'],
		atboot  => 'true',
	}
}