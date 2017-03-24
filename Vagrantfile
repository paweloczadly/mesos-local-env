Vagrant.configure("2") do |config|
  master_os = "packer-mesos-master"
  slave_os =  "packer-mesos-agent"

  master_ip = "192.168.1.2"

  config.vm.define "master" do |m|
    m.vm.box = master_os
    m.vm.hostname = "master"

    # Network:
    m.vm.network "private_network", ip: master_ip
    m.vm.network "forwarded_port", guest: 2181, host: 2181
    m.vm.network "forwarded_port", guest: 5050, host: 5050
    m.vm.network "forwarded_port", guest: 8080, host: 8080

    # Provisioners:
    m.vm.provision "shell", path: "scripts/customize_master.sh", args: "#{master_ip}"

    # VirtualBox:
    m.vm.provider "virtualbox" do |vb|
      vb.name = "master"
      vb.memory = 1024
      vb.cpus = 1
    end
  end

  2.times do |i|
    config.vm.define "agent#{i + 1}" do |a|
      a.vm.box = slave_os
      a.vm.hostname = "agent#{i + 1}"

      # Network:
      agent_ip = "192.168.1.#{3 + i}"
      port_suffix = 5051 + i
      a.vm.network "private_network", ip: agent_ip
      a.vm.network "forwarded_port", guest: 5051, host: port_suffix

      # Provisioners:
      a.vm.provision "shell", path: "scripts/customize_agent.sh", args: ["#{agent_ip}", "#{master_ip}"]

      # VirtualBox:
      a.vm.provider "virtualbox" do |vb|
        vb.name = "agent#{i + 1}"
        vb.memory = 1024
        vb.cpus = 1
      end
    end
  end
end
