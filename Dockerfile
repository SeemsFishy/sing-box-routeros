FROM ghcr.io/sagernet/sing-box:IMAGE_TAG AS main
LABEL maintainer="Dhuran"
RUN set -ex \
    && apk add --no-cahe iptables iptables-legacy \
    && rm /usr/sbin/iptables \
    && ln -s /usr/sbin/iptables-legacy /usr/sbin/iptables
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
