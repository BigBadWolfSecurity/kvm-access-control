#! /bin/bash
iptables -t security -F
iptables -t mangle -F

# Mangle table labelling
iptables -t mangle -A INPUT -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
ip netns exec namespace1 iptables -t mangle -A INPUT -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
iptables -t mangle -A OUTPUT -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
ip netns exec namespace1 iptables -t mangle -A OUTPUT -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
iptables -t mangle -A POSTROUTING -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
ip netns exec namespace1 iptables -t mangle -A POSTROUTING -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
iptables -t mangle -A PREROUTING -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
ip netns exec namespace1 iptables -t mangle -A PREROUTING -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
iptables -t mangle -A FORWARD -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
ip netns exec namespace1 iptables -t mangle -A FORWARD -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0

iptables -t mangle -A INPUT -s 192.168.6.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
ip netns exec namespace1 iptables -t mangle -A INPUT -s 192.168.6.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
iptables -t mangle -A OUTPUT -s 192.168.6.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
ip netns exec namespace1 iptables -t mangle -A OUTPUT -s 192.168.6.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
iptables -t mangle -A POSTROUTING -s 192.168.6.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
ip netns exec namespace1 iptables -t mangle -A POSTROUTING -s 192.168.6.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
iptables -t mangle -A PREROUTING -s 192.168.6.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
ip netns exec namespace1 iptables -t mangle -A PREROUTING -s 192.168.6.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
iptables -t mangle -A FORWARD -s 192.168.6.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
ip netns exec namespace1 iptables -t mangle -A FORWARD -s 192.168.6.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0

# Security table labelling
iptables -t security -A INPUT -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
ip netns exec namespace1 iptables -t security -A INPUT -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
iptables -t security -A OUTPUT -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
ip netns exec namespace1 iptables -t security -A OUTPUT -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
iptables -t security -A FORWARD -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
ip netns exec namespace1 iptables -t security -A FORWARD -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0

iptables -t security -A INPUT -s 192.168.6.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
ip netns exec namespace1 iptables -t security -A INPUT -s 192.168.6.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
iptables -t security -A OUTPUT -s 192.168.6.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
ip netns exec namespace1 iptables -t security -A OUTPUT -s 192.168.6.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
iptables -t security -A FORWARD -s 192.168.6.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
ip netns exec namespace1 iptables -t security -A FORWARD -s 192.168.6.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0

iptables -I FORWARD -i left -o right -s 192.168.5.0/24 -d 192.168.6.0/24 -j ACCEPT
ip netns exec namespace1 iptables -I FORWARD -i left -o right -s 192.168.5.0/24 -d 192.168.6.0/24 -j ACCEPT

iptables -I FORWARD -i right -o left -s 192.168.6.0/24 -d 192.168.5.0/24 -j ACCEPT
ip netns exec namespace1 iptables -I FORWARD -i right -o left -s 192.168.6.0/24 -d 192.168.5.0/24 -j ACCEPT

