FROM alpine:latest

WORKDIR /etc/bind

RUN apk --no-cache add bind
COPY config/named.conf.local /etc/bind/named.conf
COPY config/db.local-network.app /etc/bind/db.local-network.app
COPY ./config/db.172 /etc/bind/db.172

COPY ./config/entrypoint.sh /entrypoint.sh

RUN chown -R named:named /etc/bind && chmod -R 755 /etc/bind && chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 53/udp 53/tcp

CMD ["/usr/sbin/named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]