# sing-box-routeros
A copy of the official sing-box container with some additional fixes for RouterOS

This container includes iptables rules that will redirect all tcp traffic via redirect inbound. Simalarly to what you can achieve using `auto_redirect` option. Unfortunately in new sing-box versions `auto_redirect` only works for system with nftables. RouterOS doesn't have nftables support yet.
The installed iptables rules assume that you have redirect inbound configured on port 12345, example:
```
    {
      "type": "redirect",
      "listen": "172.172.0.2",
      "listen_port": 12345,
      "tag": "redirect-in"
    }
```