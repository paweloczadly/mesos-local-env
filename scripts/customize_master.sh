#!/bin/sh
MASTER_IP=$1

echo $MASTER_IP > /etc/mesos-master/ip
sudo service mesos-master restart
