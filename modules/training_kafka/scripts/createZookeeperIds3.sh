#!/usr/bin/env bash
sudo mkdir -p /var/lib/zookeeper
touch myid
echo "3" >> myid
sudo cp myid /var/lib/zookeeper/
echo "Zookeeper myid created"