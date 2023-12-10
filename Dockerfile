FROM alpine:latest

RUN apk --no-cache add bind

COPY named.conf /etc/bind/named.conf
COPY local.workspace.com.zone /etc/bind/local.workspace.com.zone
COPY 0.168.192.zone /etc/bind/0.168.192.zone

EXPOSE 53/udp 53/tcp

CMD ["/usr/sbin/named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]