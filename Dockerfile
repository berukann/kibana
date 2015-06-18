FROM alpine:latest

ENV KIBANA_VERSION 4.1.0

RUN wget -O - "http://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz" | tar zx -C /usr/local && \
    [ `sha1sum "kibana-${KIBANA_VERSION}-linux-x64.tar.gz" | awk '{print $1}'` = 'db27d030fe0f103d416cd9acad42c35a1418b5f5' ] && \
    apk --update add nodejs && \
    rm -rf /usr/local/kibana-${KIBANA_VERSION}/node && \
    ln -sf /usr/bin/node /usr/local/kibana-${KIBANA_VERSION}/node/bin/node && \
    rm -rf /var/cache/apk/*
 
ADD ./run.sh /run.sh

EXPOSE 5601

ENTRYPOINT /run.sh

