#!/bin/bash

/usr/sbin/dhcpd -4 -f -d --no-pid -cf ${DHCP_CONF} -lf ${DHCP_LEASE} ${NETWORK_IFACE}