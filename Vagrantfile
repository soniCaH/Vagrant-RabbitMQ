# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.hostname = "symfonyday-rome-mq"
	config.vm.box = "precise32"
	config.vm.box_url = "http://files.vagrantup.com/precise32.box"

	config.vm.network :forwarded_port, guest: 5672, host: 5672
	config.vm.network :forwarded_port, guest: 15672, host: 15672

  
	config.vm.provider :virtualbox do |v|
		v.name = "symfonyday-rome-mq"
	end

	config.vm.provision :shell, path: "bootstrap.sh"
end
