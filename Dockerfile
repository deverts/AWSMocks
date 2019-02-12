FROM anapsix/alpine-java:8_server-jre

LABEL maintainer "Daniel Everts <deverts3@gmail.com>"

RUN apk update && apk add --no-cache supervisor redis ca-certificates curl wget nodejs nodejs-npm && \
    npm install kinesalite && \
    mkdir /var/dynamodb/ && \
    wget -O /var/dynamodb/dynamodb_local_latest https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz && \
    tar xfz /var/dynamodb/dynamodb_local_latest -C /var/dynamodb

# Default ports
ENV KINESIS_PORT=4567 DYNAMODB_PORT=4568 REDIS_PORT=6379
EXPOSE 4567 4568 6379

COPY services.conf /etc/supervisor/conf.d/services.conf
COPY start.sh /root/start.sh

RUN chmod +x /root/start.sh

CMD /root/start.sh