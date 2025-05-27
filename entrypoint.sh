#!/bin/bash

set -e

/usr/sbin/iptables -t nat -F
/usr/sbin/iptables -t nat -X
/usr/sbin/iptables -t nat -A PREROUTING -m addrtype ! --dst-type LOCAL ! --src-type LOCAL -i eth0 -p tcp -j REDIRECT --to-port 12345


exec sing-box "$@"