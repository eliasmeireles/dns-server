FROM alpine:latest

RUN apk --no-cache add bind

COPY ./config/named.conf /etc/bind/named.conf
COPY ./config/local.workspace.com.zone /etc/bind/local.workspace.com.zone
COPY ./config/0.168.192.zone /etc/bind/0.168.192.zone

# Add this step
RUN chown -R named:named /etc/bind && chmod -R 755 /etc/bind

EXPOSE 53/udp 53/tcp

CMD ["/usr/sbin/named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]