#! /bin/bash

ip tuntap add mode tap fedoratap0
ip addr add 192.168.2.1/24 dev fedoratap0

ip tuntap add mode tap testbtap0
ip addr add 192.168.3.1/24 dev testbtap0

