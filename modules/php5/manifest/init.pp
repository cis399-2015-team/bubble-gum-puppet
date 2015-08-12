class php5 {
	package{ 'php5': ensure => installed;}
        package{ "libapache2-mod-php5": ensure => installed;}
        package{ "php5-mycrypt": ensure => installed;}
	
	file { "/var/www/html/index.php":
		source	=> ["puppet:///modules/php5/index.php"],
		mode 	=> 444,
		owner	=> root,
		group	=> root,
	}
	
}