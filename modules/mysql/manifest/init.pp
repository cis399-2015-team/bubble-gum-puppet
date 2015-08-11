class mysql {
    package {
        'mysql': ensure => installed;
    }

    file { '/etc/mysql/my.cnf':
        source  => 'puppet:///modules/mysql/my.cnf',
        mode    => 644,
        owner   => root,
        group   => root,
        require => Package['mysql'],
    }

    service { 'mysql':
        enable    => true,
        ensure    => running,
        require   => [ Package['mysql'],
                       File['/etc/mysql/my.cnf'],
        subscribe => File['/etc/mysql/my.cnf'],
    }
}