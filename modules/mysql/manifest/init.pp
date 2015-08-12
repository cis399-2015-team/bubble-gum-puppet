class mysql {
    package{ "mysql": ensure => installed;}
    
    file { '/etc/mysql/my.cnf':
        source  => 'puppet:///modules/mysql/my.cnf',
        mode    => 644,
        owner   => root,
        group   => root,
        require => Package["mysql-server"],Package["php5-mysql"],
    }

   service{ "mysql":
                  enable  => true,
                  ensure  => running,
                  require => Package["mysql"],
        }
	
}