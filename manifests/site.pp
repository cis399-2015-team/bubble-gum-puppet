 # update /etc/puppet on puppet master (use puppet master node name)
 node ip-10-0-7-34 {
    	cron { "puppet update":
	    command => "cd /etc/puppet && git pull -q origin master",
	    user    => root,
	    minute  => "*/5",
	}
    }
 node ip-10-0-7-35 {
    }

 node ip-10-0-7-36 {
    }