class sshd {
	package {
		"openssh-server": ensure => installed;
	}

	file { "/etc/ssh/sshd_config":
		mode    => 777,
		owner   => root,
		group   => root,
		source  => "puppet:///modules/sshd/sshd_config",
		require => Package["openssh-server"],
	}

	service { "sshd":
		enable     => true,
		ensure     => running,
		hasstatus  => true,
		hasrestart => true,
		require    => [ Package["openssh-server"],
			       	    File["/etc/ssh/sshd_config"], ],
		subscribe  => File["/etc/ssh/sshd_config"],

	}

	ssh_authorized_key{ "yuanfei-pair":
		user	=> "ubuntu",
		type 	=> "ssh-rsa",
		key 	=> "MIIEowIBAAKCAQEAg3RTAX8o2KTYhk+D0OBelPT6boc1pv+Hu+uAmjQjm/lAfnr2qG/88J/G3dgCHq8LlYWYUBwqWJUlVGLLh2r155WAK6s7GxC+3AycvQ0ElYTz3xreiWjwTCT85lj9Jyk0HzI+iljc972j0Z8gZyyqcJH+bXlGbSQX+nS+zHvd8VXC2Jt91NxQ2os/cuV47K4rEiFheEdoVfJ/X2Q+icFuG24b1wp1tpkJmXlphfwptuCPOA26c7uUxT5mCY7LF24X8XWNJsT1R2Yhnd45ZoFe+sQls0XV4uPtBnU/XnLh1EK8RmqSFsqKdBLcvZGEDm+G4SRfSx87YFQreHdKcuqSkwIDAQABAoIBADslq/OQc6CHC6XjQTxKuEPttoDk9Y8eisRTQpofu6YCkLJYQYOoX/ck7SYEe2+y81NjuRTSl3skIJfHnCxiRCLfcbw0X3PeJQJ96khmAxoDqHdKb7cEMJsSSXibscxdDca7pMg7E7Gk8oDvSHUj88yS5Bf96WJSSze2L+NyGHrtpcu51iQyWyzIGDbt14/FZmI9WAXn5cl1jeUgBXRegz2aa3bB1m6AJZR0jvNROoAb/zcKug/jVwSthwZA9jDX4T88yFseBKqKjpXzhbfpVdDiyIPdk8/Zpqvw924tePenIOoE4Vjac6w4CgaFZ96JgpbCkd/l7UKndGXS+9kWzgECgYEAym8c/SN+tCSPlyz0WKFh8gW5pHRmGZoJa0jqPqV82ka1GIxe/lGVfb4LH2s5sG7jN0GWe68Zrf95cr9hi0+caVRXDCw/9YjAWlZL+vq1VoGIq+S7qDMegRUSI8BIWPJt44lqRpjL3cpZvwwIBmoGJ4O0aEScW0JZSFK/uVpVmtECgYEApj0MTrRZCKWQYU1AUIO4GQjC6L3figjDydID1uB7qAF4WANL7MP3kK3IRQkeB8j5mVwyM0krWz5Ma0UbXISbNq2G5MguUybVEMFfKi5FUOSHypdXjP8/C365naOuA8SFmNUewU1qN17AkAYicCJisgKwM9gMsV7yNsqIL56Z6CMCgYAYpib1e9j1vm3tjn/COwReH+xW5gV4oJT9B0fekO/+9BUhBBadCPoW8YkRLlE79oScOdRFAzExSqZTHpKWD/+Po8Flrg2rrBcf6NofmV9zRRqLM7LV7EOOnC41RDiK/Bn9VsImDnzkaLs81A42GbreHN9ewtv3EMEmWU0XGLTLwQKBgC3nc6uUD3XcyhakT1ssVDzNd4zvSXgDXZUwYhEG4f6NkV60YlXZ81XHNyMhFmLN82aO1+njjY5fkJiad6i/kWCy4CnywSAC/BjpXM74AfoJcRnXWry7ivwwnS7TkOzHaqC+UQTNzMPHbWMX3pCaXiiLp35ZbX/ZGQdaO+ryX8uDAoGBAMClAIss1CJH/s6I20W+QHjccDYYCVU6K1xBGb+cN+PE43h15dN0fyxhD3PvSRkBHKXVx7t4Plrk0iKN/N/K2cjNoCVw76huviPap62kzZ8zTYln4hxQDUbQaoz90okWqkExF+EhPuXmPjdW5DApIE+cWvfPjrw9edZ/bH1Fr/6r",
	}

	ssh_authorized_key { "xiz-pair":
		user	=> "ubuntu", 
		type	=> "ssh-rsa",
		key	=> "MIIEowIBAAKCAQEAlVvMQJDf00Etwz5InZwB0+cMC0HxD23WvkA82SMv5GfT9N0XqNATKgi30R5xo6rjM3D5MLyjL3LnFv7MqufGKfJN0I75JtG354tJGNe+g/WEfoe9Dm0hMfZN3lA23g8n9Wisrd4JE+BrfT1T7sUhqhdHREFmI5PdyzD7h+howriuG9Ug3N3JiVcxA5sm/KxvTHm+8P8L8S4QwrQXJA9ELl63sO32sJYuB56HSy6HmblzqyBeDoUmXWRHPJodIrip9zZHr3Z9UwMLGCuJwRm1lKP0ILlbH3C9Zpu4y0eaCNeK15yOS2VEZjukXaF07p56NJPhtD1TUVhJUAWyQAx8FwIDAQABAoIBAHNUH+KXO42XXavOMyooZaznUoB62ZXtXY0ocxPDvN5kYeFIu1Up3jJt6uo51MvpT2jQSkqcznD8C37RHt60+2o2ZGmvjKmx9IyBG99n7/9bHITLcWtrTt+SbcxFKijLkTJJMlVLBr1nY/if22iapYT+VpRY33KHYhLc7syh5Aq+egSixFL8bfJkHMo/Te4D2a8Mdi+dROaXDPQl40L1fDK+qDgvu0Jm+KrYrctqwuP2OHKWvrPWo0jwJR6wdc99C4Q9qt70vtu0eks5lGu+2/pXzUNduEV686QW4Douew7hHK5Oe+oFQySJSGLegcrPS9K6ZrWo0C2hAIESNbu7UFkCgYEA26WQxGQoqzn0oNBX6dlojrfLV7C44+yKlfhKK0p3nMWnsmYd/2TJ75swlftU/WzQb1iLanbHfnT1U1MXwqfXaPi93ut1C6u7lilfMUJ1BsMUyKLHdRBLwK8gQulQJ7a7pzvZyQ0jwHfreY+UnaTTc1WQLNFiKwYByttVgHRzAwMCgYEArhQfYGnfDlxTOV/a+zmldnu7B2RGb9+1ra0QP0PeY+Ni33qEWZuf1Rci8/UJYRBl+NHiogBrrsJ67oPn0fGMuLQpLtgsAnGdIeY7/WjZPr7DDL0egPvJ1lnFSW5J6zVzNgjC/zwN8K+OhbC4R6w2G6ru4JlNv/mKmUwg2s9KzF0CgYBHRrPytxnnbpgus01ECpP+dDAdVbC57eGPBxJyd+jWy+E+aBrl7LwG8BJVKUkMMAp3h4E+XCsioyuVDYrRVQv2+XkL5NaHogPul6BXaNx3BEkzTndxSod6kJnkfLfRG2BLxYVH0+a9J20XdntgqMMhUyvFD3FOytU8Ee7uD1vfJwKBgGieiVjtZ/P+grn5pObVd17k77t6hWaZAVw2pYwQIujPcM20mTQtdnqfpA8QFinyrAZFRbptHEp0cWNFfR5M2HDtPc78dj6lv3TvJOCgkefGx/yw8FM+f8hGPW5rTRuCDRLNYzv4ALzFFZe9ZJMWqZIpQdVT7UlSFP0apqg6as61AoGBAJLnIGLwuX7UzNPAiuzYpxzbhQOcvpT1piNJ1lC4wXCqQSJR8uv1dJffl55tFSwXCwXeXyEA380NyTIuZrBaxY14VyqbIri+mkGSal7oV7m4gVonvneUrWCk5kQoA8hu/unwfH0GTqqZBwuVTKZeGRU7LBXagc0s14ROIDsm0cGb",
	}
}