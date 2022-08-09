#! /bin/bash
iptables -t security -F
iptables -t mangle -F

# Mangle table labelling

iptables -t mangle -A PREROUTING -m physdev --physdev-in right+ -j SECMARK --selctx system_u:object_r:right_packet_t:s0
iptables -t mangle -A PREROUTING -m physdev --physdev-in left+ -j SECMARK --selctx system_u:object_r:left_packet_t:s0
#iptables -t mangle -A POSTROUTING -s 192.168.6.0/24 -j SECMARK --selctx system_u:object_r:right_packet_t:s0
#iptables -t mangle -A FORWARD -i right -j SECMARK --selctx system_u:object_r:right_packet_t:s0
#iptables -t mangle -A POSTROUTING -s 10.0.0.0/24 -j SECMARK --selctx system_u:object_r:left_packet_t:s0
#iptables -t mangle -A POSTROUTING -i left -j SECMARK --selctx system_u:object_r:left_packet_t:s0

# Security table labelling
#iptables -t security -A FORWARD -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0

# Forwarding

iptables -I FORWARD -i left -o right -s 10.0.0.0/24 -d 192.168.6.0/24 -j ACCEPT
iptables -I FORWARD -i right -o left -s 192.168.6.0/24 -d 192.168.5.0/24 -j ACCEPT

