#! /bin/bash

# This enables iptables for the virtual bridges
modprobe br_netfilter

# https://wiki.archlinux.org/title/network_bridge

ip link del testbr0
ip link del fedora
ip link del testb

function create_bridge() {
    ip link add name $1 type bridge
    ip link set $1 up
    ip addr add $2 dev $1
}

function create_veth() {
    ip link add $1 type veth peer name $2
    ip link set $2 master $3
    ip link set $2 up
}

create_bridge testbr0 192.168.5.3/24
create_veth fedora fedora2testbr0 testbr0
create_veth testb testb2testbr0 testbr0

ip link set testbr0 up
