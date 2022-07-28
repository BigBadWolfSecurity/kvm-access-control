#! /bin/bash

# This enables iptables for the virtual bridges
modprobe br_netfilter

# https://wiki.archlinux.org/title/network_bridge

ip link del left
ip link del right
ip netns delete namespace1

function create_bridge() {
    ip netns exec $4 ip link add name $1 type bridge
    ip netns exec $4 ip link set $1 up
    ip netns exec $4 ip addr add $2 dev $1
    ip netns exec $4 ip addr add $3 dev $1
}

function create_veth() {
    ip link add $1 type veth peer name $2
    ip link set $2 netns $4
    ip netns exec $4 ip link set $2 master $3
    ip netns exec $4 ip link set $2 up
}

ip netns add namespace1
create_bridge testbr0 192.168.5.3/24 192.168.6.3/24 namespace1
create_veth left lefttestbr0 testbr0 namespace1
create_veth right righttestbr0 testbr0 namespace1

ip netns exec namespace1 ip link set testbr0 up
