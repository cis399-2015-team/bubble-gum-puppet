node ip-10-0-7-7 {
    }

    node ip-10-0-7-8 {
    }

# update /etc/puppet on puppet master (use puppet master node name)
    node ip-10-0-7-6 {
    	cron { "puppet update":
	    command => "cd /etc/puppet && git pull -q origin master",
	    user    => root,
	    minute  => "*/5",
	}
    }