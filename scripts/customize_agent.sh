#!/bin/bash
AGENT_IP=$1
MASTER_IP=$2

echo $MASTER_IP:5050 > /etc/mesos/zk
echo $AGENT_IP > /etc/mesos-slave/ip
sudo service mesos-slave restart
