 
# 3 	exec  {"Download sample": 
# 4 		command => "/usr/bin/git clone https://github.com/heroku/node-js-sample.git /home/vagrant/SampleSite", 
# 5 		creates => "/home/vagrant/SampleSite", 
# 6 		timeout => 0 
# 7 	} 
# 8 
 
# 9 	exec {"Install express": 
# 10 		command => "/usr/local/node/node-default/bin/npm install --prefix /home/vagrant/SampleSite express", 
# 11 		timeout => 0 
# 12 	} 
# 13 	 
# 14 	exec {"Install forever": 
# 15 		command => "/usr/bin/sudo /usr/local/node/node-default/bin/npm install forever -g", 
# 16 		timeout => 0 
# 17 	} 

exec {"Do Update": 
	command => "/usr/bin/sudo /usr/bin/apt-get update", 
	timeout => 0 
}

exec {"Install Git": 
	command => "/usr/bin/sudo /usr/bin/apt-get -y install git", 
	timeout => 0 
} 
->
exec  {"Download Samples": 
 	command => "/usr/bin/git clone https://github.com/lawrencetaylor/DockerSamples.git /home/vagrant/DockerSamples", 
 	creates => "/home/vagrant/DockerSamples", 
 	timeout => 0  	
 } 

exec {"Install Docker": 
	command => "/usr/bin/sudo /usr/bin/apt-get -y install docker.io", 
	timeout => 0 
} 

exec {"Create Redis Docker File":
	command => "/usr/bin/ruby /home/vagrant/DockerSamples/tocker.rb -c /home/vagrant/DockerSamples/DockerFileConfigs/redis_on_ubuntu_14_10.json -t /home/vagrant/DockerSamples/Redis -td /home/vagrant/DockerSamples/Templates/dockerfile.erb",
	timeout => 0,
	creates => "/home/vagrant/DockerSamples/Redis/dockerfile",
	require => [Exec["Download Samples"], Exec["Install Docker"]]
}


