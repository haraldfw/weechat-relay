FROM alpine

RUN apk add --update\
    weechat\
    python\
    bash\
    openssl\
    && rm -rf /var/cache/apk/*

ENV LANG C.UTF-8
ENV HOME /weechat

#Create user to run weechat
RUN mkdir -p $HOME/.weechat\
    && addgroup weechat\
    && adduser -h $HOME -D -s /bin/bash -G weechat weechat\
    && chown -R weechat:weechat $HOME

#Expose for persistence
VOLUME /weechat/.weechat

#COPY entrypoint.sh /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]

WORKDIR $HOME
USER weechat

CMD weechat -r "/set relay.network.ssl_cert_key /weechat/.weechat/ssl/relay.pem; \
    /relay sslcertkey; \
    /relay add ssl.weechat $PORT; \
    /set relay.network.password $PASSWORD; \
    /server add freenode chat.freenode.net; \
    /connect freenode"
