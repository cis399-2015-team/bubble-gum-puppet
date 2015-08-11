class php5 {
    package {
        'php5': ensure => installed;
    }

    file { '/var/www/html/index.php':
        source  => 'puppet:///modules/php5/index.php',
        mode    => 644,
        owner   => root,
        group   => root,
        require => Package['php5'],
    }

    service { 'php5':
        enable    => true,
        ensure    => running,
        require   => [ Package['php5'],
                       File['/var/www/html/index.php']]
    }
}