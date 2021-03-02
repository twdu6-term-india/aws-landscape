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

Host kafka-test.${TRAINING_COHORT}.training
	ForwardAgent yes
	ProxyCommand ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ec2-user@${BASTION_PUBLIC_IP} -W %h:%p 2>/dev/null
	User ec2-user
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
" >> ~/.ssh/config

echo "====SSH Config Updated===="
scp ./images/training_kafka/conf/server.properties ec2-user@kafka-test.${TRAINING_COHORT}.training:/tmp/kafka-server.properties
ssh kafka.${TRAINING_COHORT}.training <<EOF
set -e
sudo systemctl restart confluent-kafka
EOF
echo "=== Kafka server properties deployed successfully"
