# -*- mode: ruby -*-
# vi: set ft=ruby :

#vagrant plugin 'vagrant-vbguest'



nodes = [
#  { :hostname => 'example', :ip => '192.168.56.', :forwards => [{:host => '23106', :guest => '3306', :id => 'sql'}], :mounts => [{:src => '/opt/jira_bkp', :mnt => '/home/vagrant/jira_bkp'}] },
    { :hostname => 'adminbox', :ip => '192.168.56.105' },
    { :hostname => 'blurkie', :ip => '192.168.56.106' },
    { :hostname => 'donkie', :ip => '192.168.56.107' },
    { :hostname => 'zugzug', :ip => '192.168.56.108' },
]

Vagrant.configure(2) do |config|

  nodes.each do |node|
    config.vm.define node[:hostname] do |conf|
      conf.vm.box = "ubuntu/xenial64"
      conf.vm.box_url = "ubuntu/xenial64"
      config.vm.provider "virtualbox" do |v|
        v.memory = node[:ram] ? node[:ram] : 1024;
        v.cpus = 2
        v.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
      end
      conf.vm.host_name = node[:hostname]
      conf.vm.network :private_network, ip: node[:ip]

      if node[:forwards]
        node[:forwards].each do |forward|
          conf.vm.network :forwarded_port, guest: forward[:guest], host: forward[:host], id: forward[:id]
        end
      end

      if node[:mounts]
        node[:mounts].each do |mount|
          conf.vm.synced_folder mount[:src], mount[:mnt], create: true
        end
      end

      conf.vm.provision "shell", path: "prep.sh"

    end
  end
end

