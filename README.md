# Vagrant RabbitMq Box for Footbel

## About

This box contains a vagrant set-up that allows you to create a develop environment with RabbitMq and RabbitMq Web Management

## Install

* Download and install [Vagrant](http://downloads.vagrantup.com/)
* Download and install  [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Clone the project ```git clone --recursive git@github.com:soniCaH/Vagrant-RabbitMQ.git```
* In the project dir run ```vagrant up```

## Installed Services

RabbitMQ will create a new user with username 'kevin' and password 'kevin'. Please change this in ```bootstrap.sh``` before using this on a machine that can be reached from the evil outside world.

### RabbitMQ

host: localhost
port: 5672

### RabbitMQ Web client

url: http://localhost:15672/
username: kevin
password: kevin

### RabbitMQ CLI Consumer

If you are a fellow PHP developer just like me you're probably aware of the following fact: PHP really SUCKS in long running tasks.

When using RabbitMQ with pure PHP consumers you have to deal with stability issues. Probably you are killing your consumers regularly just like me. And try to solve the problem with supervisord. Which also means on every deploy you have to restart your consumers. A little bit dramatic if you ask me.

This library aims at PHP developers solving the above described problem with RabbitMQ. Why don't let the polling over to a language as Go which is much better suited to run long running tasks.

## Vagrant basic commands

* start box: ```vagrant up```
* ssh into box: ```vagrant ssh```
* shutdown box: ```vagrant halt```
* suspend box: ```vagrant suspend``
* destroy box: ```vagrant destroy```

## Links:
-  [Vagrant](http://downloads.vagrantup.com/)
-  [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
-  [RabbitMQ CLI Consumer](https://github.com/ricbra/rabbitmq-cli-consumer)
