#!/bin/bash
# Usage ./reset-network.sh interface ip netmask

[ $# -lt 3 ] && { echo -e "Missing arguments\nUsage: ./reset-network interface ip netmask"; exit 1; }

. /etc/xensource-inventory

PIF=$(xe pif-introduce device=$1 host-uuid=${INSTALLATION_UUID})

/usr/bin/xe pif-reconfigure-ip uuid=${PIF} mode=static ip=$2 netmask=$3

/usr/bin/xe host-management-reconfigure pif-uuid=${PIF}

