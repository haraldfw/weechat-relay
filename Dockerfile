FROM alpine
#MAINTAINER Harald Floor Wilhelmsen

RUN apk add --update-cache weechat-dev && rm -rf /var/cache/apk/*

ADD entrypoint.sh /entrypoint.sh

WORKDIR /

ENTRYPOINT ["./entrypoint.sh"]

CMD ["weechat", "-r", '/set relay.network.password $PASSWORD', "-r", '"/relay add ssl.weechat $PORT"']
