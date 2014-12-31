Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080 
  config.vm.network :forwarded_port, guest: 6379, host: 6379
  config.vm.network :forwarded_port, guest: 27017, host: 27017
  config.vm.network :forwarded_port, guest: 8000, host: 8000
  config.vm.network :forwarded_port, guest: 2368, host: 2368

  config.vm.network :private_network, ip: "192.168.33.10"

  config.vm.provision "puppet"

end
