#!/bin/bash
# Usage ./reset-network.sh interface ip netmask

[ $# -lt 3 ] && { echo -e "Missing arguments\nUsage: ./reset-network interface ip netmask label"; exit 1; }

. /etc/xensource-inventory

PIF=$(/usr/bin/xe pif-introduce device=$1 host-uuid=${INSTALLATION_UUID})

NETWORKPIF=$(/usr/bin/xe pif-list uuid=${PIF} params="network-uuid" --minimal)
/usr/bin/xe network-param-set uuid=${NETWORKPIF} name-label=${4}

if [ ${4} == "MGMT" ]
then
	/usr/bin/xe pif-reconfigure-ip uuid=${PIF} mode=static ip=${2} netmask=${3}
	/usr/bin/xe host-management-reconfigure pif-uuid=${PIF}
else
	/usr/bin/xe pif-plug uuid=${PIF}
fi
