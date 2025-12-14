FROM ghcr.io/sagernet/sing-box:IMAGE_TAG AS main
LABEL maintainer="Dhuran"
RUN set -ex \
    && apk upgrade \
    && apk add gcompat iptables iptables-legacy\
    && rm -rf /var/cache/apk/* \
    && rm /usr/sbin/iptables \
    && ln -s /usr/sbin/iptables-legacy /usr/sbin/iptables
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
