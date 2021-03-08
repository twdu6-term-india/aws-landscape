#!/usr/bin/env bash
set -ex

BASTION_PUBLIC_IP=$1
TRAINING_COHORT=$2

echo "====Updating SSH Config===="

echo "
	User ec2-user
	IdentitiesOnly yes
	ForwardAgent yes
	DynamicForward 6789
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null

Host kafka.${TRAINING_COHORT}.training
	ForwardAgent yes
	ProxyCommand ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ec2-user@${BASTION_PUBLIC_IP} -W %h:%p 2>/dev/null
	User ec2-user
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null

Host kafka2.${TRAINING_COHORT}.training
	ForwardAgent yes
	ProxyCommand ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ec2-user@${BASTION_PUBLIC_IP} -W %h:%p 2>/dev/null
	User ec2-user
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null

Host kafka3.${TRAINING_COHORT}.training
	ForwardAgent yes
	ProxyCommand ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ec2-user@${BASTION_PUBLIC_IP} -W %h:%p 2>/dev/null
	User ec2-user
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
" >> ~/.ssh/config

echo "====SSH Config Updated===="
for host in kafka1.${TRAINING_COHORT}.training kafka2.${TRAINING_COHORT}.training kafka3.${TRAINING_COHORT}.training
do
  scp ./images/training_kafka/conf/zookeeper.properties ec2-user@${host}:/tmp/zookeeper.properties
  ssh ${host} <<EOF
  set -e
  sudo mv /tmp/zookeeper.properties /etc/kafka/zookeeper.properties
  sudo systemctl restart confluent-zookeeper
EOF
done
echo "=== Zookeeper properties deployed successfully"
