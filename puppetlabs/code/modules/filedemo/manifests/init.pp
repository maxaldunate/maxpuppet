class filedemo {

    File {
            owner => 'root',
            group => 'finance',
            mode  => '0660',
    }

    $homedir = '/root'
    $content = "myfile1 content"

    file {"${homedir}/myfile1.txt":
        content => $content,
    }

    file {"${homedir}/myfile2.txt":
        content => "myfile 2 content",
    }

    file {"${homedir}/myfile3.txt":
        content => "myfile 3",
        owner   => admin,
        group   => root,
    }

    file { '/root/motd':
        ensure => present,
        #content => 'this is my motd file managed by contente attributes',
        source   => 'puppet:///modules/filedemo/motd',
        owner => root,
        group => root,
        mode => '0644',
        }

    file { '/etc/motd':
           ensure => link,
           target => '/root/motd',
    }
}
