class mysql {
    package{ "mysql": ensure => installed;}
    package{ "libapache2-mod-auth-mysql": ensure => installed;}
    package{ "php5-mysql": ensure => installed;}
    
    file { '/etc/mysql/my.cnf':
        source  => 'puppet:///modules/mysql/my.cnf',
        mode    => 644,
        owner   => root,
        group   => root,
        require => Package["mysql"],
    }
    service{ "mysql-server":
                  enable  => true,
                  ensure  => running,
                  require => Package["mysql-server"],
        }
        service{ "libapache2-mod-auth-mysql":
                  enable  => true,
                  ensure  => running,
                  require => Package["libapache2-mod-auth-mysql"],
        }
        service{ "php5-mysql":
                  enable  => true,
                  ensure  => running,
                  require => Package["php5-mysql"],
        }

 
	
}