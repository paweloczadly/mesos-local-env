# mesos-local-env

Local environment for the Mesos cluster.

# prerequisites

1. VirtualBox
1. Packer
1. Vagrant

# setup

Build golden images:

```bash
$ cd packer
$ packer build --force -only virtualbox-iso packer-master.json
$ packer build --force -only virtualbox-iso packer-agent.json
```

Add Vagrant boxes:

```bash
$ cd packer
$ vagrant box add packer-mesos-master builds/master-virtualbox.box --force
$ vagrant box add packer-mesos-agent builds/agent-virtualbox.box --force
```

# bootstrap

```bash
$ vagrant up
```
