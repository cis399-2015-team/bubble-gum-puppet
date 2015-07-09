node ip-10-0-7-186 {
	cron { "puppet update":
	    command => "cd /etc/puppet && git pull -q origin master",
	    user    => root,
	    minute  => "*/5",
	}
    }

node ip-10-0-7-249 {
    }

node ip-10-0-7-211 {
    }