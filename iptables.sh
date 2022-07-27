#! /bin/bash
iptables -t security -F
iptables -t mangle -F

#iptables -t security -A INPUT -i virbr0 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t security -A INPUT -i virbr0-nic -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t security -A INPUT -i vnet1 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t security -A INPUT -i en02 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t security -A OUTPUT -o en02 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0

#iptables -t security -A INPUT -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t security -A OUTPUT -j SECMARK --selctx system_u:object_r:bare_packet_t:s0

#iptables -t security -A FORWARD -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t mangle -A PREROUTING -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t mangle -A POSTROUTING -j SECMARK --selctx system_u:object_r:bare_packet_t:s0

#iptables -t mangle -A PREROUTING -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t mangle -A POSTROUTING -j SECMARK --selctx system_u:object_r:bare_packet_t:s0

#iptables -t security -A INPUT -i macvtap7 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t security -A INPUT -i macvtap7@testb -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t security -A OUTPUT -o macvtap1 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t security -A INPUT -i macvtap6 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t security -A INPUT -i macvtap6@fedora -j SECMARK --selctx system_u:object_r:bare_packet_t:s0

#iptables -t security -A INPUT -i fedora -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t security -A OUTPUT -o fedora -j SECMARK --selctx system_u:object_r:bare_packet_t:s0

#iptables -t security -A OUTPUT -o testbr0 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t security -A INPUT -i testbr0 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0

iptables -t mangle -A INPUT -m physdev --physdev-in fedora2testbr0 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
iptables -t mangle -A FORWARD -m physdev --physdev-out fedora2testbr0 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t mangle -A FORWARD -m physdev --physdev-in testb2testbr0 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t mangle -A FORWARD -m physdev --physdev-out testb2testbr0 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t mangle -A PREROUTING -m physdev --physdev-out testb2testbr0 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t mangle -A POSTROUTING -m physdev --physdev-is-bridged -j SECMARK --selctx system_u:object_r:bare_packet_t:s0


iptables -t mangle -A INPUT -s 192.168.5.0/24 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0

# iptables -t mangle -A INPUT -i fedora -j DROP
# iptables -t mangle -A INPUT -i testb -j DROP

# iptables -t mangle -A INPUT -i macvtap6 -j DROP
# iptables -t mangle -A INPUT -i macvtap8 -j DROP

# iptables -t mangle -A OUTPUT -o testbr0 -j DROP
# iptables -t mangle -A OUTPUT -o testbr0 -j DROP

# iptables -t mangle -A OUTPUT -o fedora -j DROP
# iptables -t mangle -A OUTPUT -o testb -j DROP

# iptables -t mangle -A OUTPUT -o macvtap6 -j DROP
# iptables -t mangle -A OUTPUT -o macvtap8 -j DROP

# iptables -t mangle -A FORWARD -o testbr0 -j DROP

#iptables -t security -A FORWARD -o testbr0 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0

#iptables -t security -A INPUT -i testb -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t security -A OUTPUT -o testb -j SECMARK --selctx system_u:object_r:bare_packet_t:s0

#iptables -t security -A FORWARD -i virbr0 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0

#iptables -t security -A OUTPUT -j SECMARK --selctx system_u:object_r:bare_packet_t:s0

#iptables -t security -A NAT -i virbr0-nic -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t security -A NAT -i vnet1 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
#iptables -t security -A NAT -i en02 -j SECMARK --selctx system_u:object_r:bare_packet_t:s0
