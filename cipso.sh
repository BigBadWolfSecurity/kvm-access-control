#! /bin/bash
set -o xtrace

# https://paulmoore.livejournal.com/7234.html

netlabelctl cipsov4 del doi:1
netlabelctl cipsov4 add pass doi:1 tags:1

netlabelctl unlbl del interface:testbr0 address:192.168.6.0/24
netlabelctl unlbl add interface:testbr0 address:192.168.6.0/24 label:system_u:object_r:right_vm_t:s0

netlabelctl unlbl del interface:testbr0 address:10.0.0.0/24
netlabelctl unlbl add interface:testbr0 address:10.0.0.0/24 label:system_u:object_r:left_vm_t:s0

