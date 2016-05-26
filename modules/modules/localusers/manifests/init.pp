class localusers {
        user { 'admin':
                ensure     => present,
                shell      => '/bin/bash',
                home       => '/home/admin',
                gid        => 'wheel',
                managehome => true,
                password   => '$6$Q4oMNz5X$E1uOaJ9Az1iGxhAoBZkHSDVI27LA7sumBAb.JqT.Mj.jdBIo8imGQRDKHfMhTkZtscyK66lep0VQxHiDwQQaF',
        }

        user { 'jeff':
                ensure      => present,
                shell       => '/bin/bash',
                home        => '/home/jeff',
                groups      => ['wheel','finance'],
                managehome  => true,
        }
}
