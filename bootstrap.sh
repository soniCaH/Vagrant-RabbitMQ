#!/usr/bin/env bash

cat >> /etc/apt/sources.list <<EOT
deb http://www.rabbitmq.com/debian/ testing main
deb http://apt.vandenbrand.org/debian testing main
EOT

wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
apt-key add rabbitmq-signing-key-public.asc

wget http://apt.vandenbrand.org/apt.vandenbrand.org.gpg.key
apt-key add apt.vandenbrand.org.gpg.key

apt-get update
apt-get install -q -y screen htop vim curl wget
apt-get install -q -y rabbitmq-server

rabbitmqctl add_user kevin apestront
rabbitmqctl set_user_tags kevin administrator
rabbitmqctl set_permissions kevin ".*" ".*" ".*"

# RabbitMQ Plugins
service rabbitmq-server stop
rabbitmq-plugins enable rabbitmq_management
#rabbitmq-plugins enable rabbitmq_jsonrpc
#rabbitmq-plugins enable rabbitmq_federation
#rabbitmq-plugins enable rabbitmq_federation_management
service rabbitmq-server start

apt-get install -q -y rabbitmq-cli-consumer
