# docker-dhcpd
isc-dhcp-server running in docker based on debian:stretch-slim

## What is it?
Just a simple dhcp server running in a docker container.

## How to configure it?
1. Clone or download the repo.
2. Take a look at the environments variables in the Dockerfile, especially the network interface one and modify them (or not) at your convenience.
3. The dhcp confiugration is located in [conf/dhcpd.conf](conf/dhcpd.conf), modify it so it suits your needs.
4. If you need specific settings like using ipv6, the dhcpd server is started in [entrypoint.sh](entrypoint.sh)
5. `docker build -t image_name .`

## How to start it?

Once you modified what you needed to, you can either start it with ```docker run``` or with compose, don't forget to specify the network in both cases, here are some examples:

`docker run -d --name dhcpd_server --net=host image_name`

*for compose:*
```
  dhcp:
    build:
        context: .
    network_mode: "host"
```

