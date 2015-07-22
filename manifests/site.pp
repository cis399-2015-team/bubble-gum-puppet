 # update /etc/puppet on puppet master (use puppet master node name)
 node ip-10-0-7-57 {
    	cron { "puppet update":
	    command => "cd /etc/puppet && git pull -q origin master",
	    user    => root,
	    minute  => "*/5",
	}
	include sshd
	include web-server
	include postfix

    }
 node ip-10-0-7-237 {
	include sshd
	include web-server
	include postfix
    }

 node ip-10-0-7-236 {
	include sshd
	include web-server
	include postfix
    }
