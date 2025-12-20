FROM alpine:3.19.1
RUN apk add --no-cache openssh-client ansible git py3-lxml

COPY main.yml .
COPY get_connection_info.yml .
COPY manage_record.yml .
COPY dyndns.yml .
COPY entrypoint.sh /

ENV IPV6_IDENTIFIER

RUN chmod +x /entrypoint.sh

CMD [ "/bin/sh", "-c", "/entrypoint.sh"]
