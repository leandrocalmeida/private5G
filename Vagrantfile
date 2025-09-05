Vagrant.configure("2") do |config|

    config.vm.define "ran" do |r|
        c.vm.box = "ubuntu/focal64"
  	c.vm.box_version = "20240821.0.1"
        c.vm.hostname = "ran"
        c.vm.network "private_network", ip: "192.168.50.51", mac: "080027000001",
            virtualbox__intnet: "ran-core"
        c.vm.provider "virtualbox" do |v|
            v.memory = 4096
            v.cpus = 2
        end
    end
    
    config.vm.define "core" do |c|
        c.vm.box = "ubuntu/focal64"
  	c.vm.box_version = "20240821.0.1"
        c.vm.hostname = "core"
        c.vm.network "private_network", ip: "192.168.50.52", mac: "080027000002",
            virtualbox__intnet: "ran-core"
        c.vm.provider "virtualbox" do |v|
            v.memory = 4096
            v.cpus = 2
        end
    end
end