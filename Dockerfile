FROM debian:stretch-slim

ENV DHCP_CONF /etc/dhcp/dhcpd.conf
ENV DHCP_LEASE /etc/dhcp/dhcp.leases

# specify the network interface the dhcp is supposed to use, 
# use "ip show link" to find out or set it empty for all interfaces
# example:
# ENV NETWORK_IFACE eth0
ENV NETWORK_IFACE " "
# specify the network ex:(--net=host) when you run the container for it to access the physical iface

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y isc-dhcp-server && \
    apt-get autoremove -y && apt-get clean && apt-get autoclean

COPY conf/dhcpd.conf ${DHCP_CONF}
COPY entrypoint.sh /opt/entrypoint.sh

RUN chmod +x /opt/entrypoint.sh && \
    touch ${DHCP_LEASE}

ENTRYPOINT [ "/opt/entrypoint.sh" ]
