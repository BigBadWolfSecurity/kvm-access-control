#! /bin/bash
iptables -t security -F
iptables -t mangle -F
iptables -t nat -F
iptables -F

# Mangle table labelling

iptables -t mangle -A PREROUTING -m physdev --physdev-in right+ -j SECMARK --selctx system_u:object_r:right_packet_t:s0
iptables -t mangle -A PREROUTING -m physdev --physdev-in left+ -j SECMARK --selctx system_u:object_r:left_packet_t:s0

# Forwarding

#iptables -t raw -A PREROUTING -p tcp -d 192.168.6.0/24 -j TRACE

iptables -I FORWARD -d 192.168.6.0/24 -j ACCEPT
iptables -I FORWARD -d 10.0.0.0/24 -j ACCEPT


