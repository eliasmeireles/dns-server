#!/bin/sh
echo "nameserver 172.30.0.2
nameserver 127.0.0.53
nameserver 127.0.0.11
search bbrouter
options ndots:0" > /etc/resolv.conf
exec "$@"