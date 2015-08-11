 # update /etc/puppet on puppet master (use puppet master node name)
 node ip-10-0-7-57 {
    	cron { "puppet update":
	    command => "cd /etc/puppet && git pull -q origin master",
	    user    => root,
	    minute  => "*/5",
	}
	
	include sshd
	include postfix
	include apache2
	#include php5
	#include mysql

    }
 node ip-10-0-7-237 {
	include sshd
	include postfix
	include apache2
	#include php5
	#include mysql
    }

 node ip-10-0-7-236 {
	include sshd
	include postfix
	include apache2
	#include php5
	#include mysql
    }
