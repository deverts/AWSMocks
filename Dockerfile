FROM node:8.2-alpine

LABEL maintainer "Daniel Everts <deverts3@gmail.com>"

RUN apk update && apk add supervisor redis
RUN npm install dynalite kinesalite

# Default ports
ENV KINESIS_PORT=4567 DYNAMODB_PORT=4568 REDIS_PORT=6379
EXPOSE 4567 4568 6379

COPY services.conf /etc/supervisor/conf.d/services.conf

CMD supervisord -n