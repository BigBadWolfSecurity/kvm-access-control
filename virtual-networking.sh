#! /bin/bash
set -o xtrace

# This enables iptables for the virtual bridges
modprobe br_netfilter

# https://wiki.archlinux.org/title/network_bridge

# This used to put things into a namespace - there are problems using netlabelctl in a namespace however, so this
# version is not in a namespace. You can still see the old code however.

ip link del left
ip link del right
ip link del testbr0
ip netns delete namespace1

function create_bridge() {
    #ip netns exec $4 ip link add name $1 type bridge
    #ip netns exec $4 ip link set $1 up
    #ip netns exec $4 ip addr add $2 dev $1
    #ip netns exec $4 ip addr add $3 dev $1

    ip link add name $1 type bridge
    ip link set $1 up
    ip addr add $2 dev $1
    ip addr add $3 dev $1
}

function create_veth() {
    ip link add $1 type veth peer name $2
    #ip link set $2 netns $4
    ip link set $2 master $3
    ip link set $2 up
    ip link set $1 up

    #ip netns exec $4 ip link set $2 master $3
    #ip netns exec $4 ip link set $2 up
}

ip netns add namespace1
create_bridge testbr0 192.168.6.3/24 10.0.0.3/24 namespace1
create_veth left lefttestbr0 testbr0 namespace1
create_veth right righttestbr0 testbr0 namespace1

#ip netns exec namespace1 ip link set testbr0 up

ip link set testbr0 up
