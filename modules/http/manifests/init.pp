class http{
	file { "/var/www/html/index.php":
		source	=> ["puppet:///modules/http/$hostname/index.php",
			    "puppet:///modules/http/index.php",],
		mode	=> 444,
		owner	=> root,
		group 	=> root,
	}
	
}