#! /bin/bash
set -o xtrace

# https://paulmoore.livejournal.com/7234.html

netlabelctl cipsov4 del doi:1
#netlabelctl cipsov4 del doi:2
netlabelctl cipsov4 add pass doi:1 tags:1
#netlabelctl cipsov4 add local doi:1


#netlabelctl map del default
#netlabelctl map add default address:0.0.0.0/0 protocol:unlbl  
#netlabelctl map add default address:::/0 protocol:unlbl

netlabelctl unlbl del interface:testbr0 address:0.0.0.0/0 label:system_u:object_r:left_vm_t:s0
netlabelctl unlbl add interface:testbr0 address:192.168.6.0/24 label:system_u:object_r:right_vm_t:s0
netlabelctl unlbl add interface:testbr0 address:10.0.0.0/24 label:system_u:object_r:left_vm_t:s0
#netlabelctl unlbl add interface:macvtap1 address:0.0.0.0/0 label:system_u:object_r:right_vm_t:s0
#netlabelctl unlbl add interface:left address:0.0.0.0/0 label:system_u:object_r:left_vm_t:s0
#netlabelctl unlbl add interface:right address:0.0.0.0/0 label:system_u:object_r:right_vm_t:s0
