FROM node:lts-alpine

ENV DOCKER=true

RUN apk add --no-cache su-exec

VOLUME /data
WORKDIR /app

RUN addgroup -g 1001 ganache && adduser -u 1001 -G ganache -s /bin/sh -D ganache

RUN npm install -g ganache-cli

EXPOSE 8545

COPY ./entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]

CMD ["ganache-cli"]
