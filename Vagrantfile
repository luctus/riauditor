VAGRANTFILE_API_VERSION = "2"
VAGRANT_JSON = JSON.parse(File.read("./vagrant.json"))

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise64"
  #config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--name", "RI Auditor"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
  end

  config.vm.synced_folder ".", "/riauditor", type: 'nfs'

  config.vm.hostname = "riauditor"

  config.vm.network :private_network, ip: "33.33.33.112"
  config.vm.network :forwarded_port, host: 3000, guest: 3001

  config.vm.provision :shell, :inline => 'apt-get update'
  config.vm.provision :shell, :inline => 'apt-get install -y build-essential ruby1.9.1-dev --no-upgrade'
  config.vm.provision :shell, :inline => "gem install chef --version 11.10.4 --no-rdoc --no-ri --conservative"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["chef/cookbooks", "chef/site-cookbooks"]
    chef.log_level = :info
    chef.json = VAGRANT_JSON
    chef.run_list = VAGRANT_JSON.delete('run_list')
  end

end
