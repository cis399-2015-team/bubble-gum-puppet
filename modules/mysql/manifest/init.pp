class mysql {
    package{ "mysql": ensure => installed;}
    package{ "libapache2-mod-auth-mysql": ensure => installed;}
    package{ "php5-mysql": ensure => installed;}
    


 
	
}