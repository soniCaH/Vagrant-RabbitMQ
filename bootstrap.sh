#!/usr/bin/env bash

# Add debian package sources to apt-get sources.

cat >> /etc/apt/sources.list <<EOT
# RabbitMQ repository.
deb http://www.rabbitmq.com/debian/ testing main

# RabbitMQ CLI.
deb http://apt.vandenbrand.org/debian testing main
EOT

# Add keys so we can retrieve packages from this URL.
wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
apt-key add rabbitmq-signing-key-public.asc

wget http://apt.vandenbrand.org/apt.vandenbrand.org.gpg.key
apt-key add apt.vandenbrand.org.gpg.key

# Install helper packages.
apt-get update
apt-get install -q -y screen htop vim curl wget

# Install RabbitMQ
apt-get install -q -y rabbitmq-server

# Initiate default RabbitMQ admin user.
rabbitmqctl add_user kevin kevin
rabbitmqctl set_user_tags kevin administrator
rabbitmqctl set_permissions kevin ".*" ".*" ".*"

# Install RabbitMQ Plugins.
service rabbitmq-server stop
rabbitmq-plugins enable rabbitmq_management					# Admin web interface.
#rabbitmq-plugins enable rabbitmq_jsonrpc
#rabbitmq-plugins enable rabbitmq_federation
#rabbitmq-plugins enable rabbitmq_federation_management
service rabbitmq-server start

# Install RabbitMQ CLI Consumer.
apt-get install -q -y rabbitmq-cli-consumer
