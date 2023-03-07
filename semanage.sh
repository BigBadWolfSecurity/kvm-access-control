#! /bin/bash
set -o xtrace

semanage interface -a testbr0 -t testbr_netif_t
