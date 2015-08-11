class mysql {
    package{ "php5-mysql": ensure => installed;}
    package{ "mysql-server": ensure => installed;}

    file { '/etc/mysql/my.cnf':
        source  => 'puppet:///modules/mysql/my.cnf',
        mode    => 644,
        owner   => root,
        group   => root,
        require => Package["mysql-server"],Package["php5-mysql"],
    }

   service{ "mysql-server":
                  enable  => true,
                  ensure  => running,
                  require => Package["mysql-server"],
        }
	service{ "php5-mysql":
                  enable  => true,
                  ensure  => running,
                  require => Package["php5-mysql"],
        }
}