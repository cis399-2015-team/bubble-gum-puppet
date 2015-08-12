class php5 {
	package{ 'php5': ensure => installed;}
      
	
	file { "/var/www/html/index.php":
		source	=> ["puppet:///modules/php5/index.php"],
		mode 	=> 444,
		owner	=> root,
		group	=> root,
	}

}