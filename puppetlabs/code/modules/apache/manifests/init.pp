class apache (
	$package_name = $apache::params::package_name,
	$service_name = $apache::params::service_name,
	$vhost_dir 	  = $apache::params::vhost_dir,
	$document_root = $apache::params::document_root,
	$servername = $apache::params::servername,
	$log_dir = $apache::params::log_dir
	) inherits apache::params {

	include apache::package
	include apache::service

	file { $log_dir:
		ensure 	=> directory,
		recurse => true,
	}

	apache::vhost {"default":
		port          => 80,
		document_root => $document_root,
		servername    => $servername,
		vhost_dir     => $vhost_dir,
	}

	apache::vhost {"maxaldunate1b":
		port          => 80,
		document_root => "{$document_root}/maxaldunate1b.mylabserver.com",
		servername    => "maxaldunate1b.mylabserver.com",
		vhost_dir     => $vhost_dir,
	}

}