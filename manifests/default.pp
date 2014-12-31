
exec {"Add docker repository key": 
	command => "/usr/bin/sudo /usr/bin/apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9", 
	timeout => 0 
} ->
exec {"Add docker to repositories list":
	command => "/usr/bin/sudo sh -c 'echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list'",
	timeout => 0
} -> 
exec {"Do Update": 
	command => "/usr/bin/sudo /usr/bin/apt-get update", 
	timeout => 0 
} -> 
exec {"Install Docker":
	command => "/usr/bin/sudo /usr/bin/apt-get -y install lxc-docker",
	timeout => 0
}


