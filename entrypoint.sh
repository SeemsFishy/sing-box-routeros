#!/bin/bash

set -e

/usr/sbin/iptables -t nat -F
/usr/sbin/iptables -t nat -X
/usr/sbin/iptables -t nat -A PREROUTING -m addrtype ! --dst-type LOCAL ! --src-type LOCAL -i $(ip a | awk '/inet.*global/ {print $NF}' | grep -v tun) -p tcp -j REDIRECT --to-port 12

exec sing-box "$@"
