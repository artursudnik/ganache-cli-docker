FROM node:lts-alpine

ENV DOCKER=true

RUN apk add --no-cache su-exec

VOLUME /data
WORKDIR /app

RUN addgroup -g 1001 ganache && adduser -u 1001 -G ganache -s /bin/sh -D ganache

RUN npm install -g ganache-cli

EXPOSE 8545

COPY ./entrypoint.sh .

HEALTHCHECK --interval=2s --timeout=2s --start-period=2s --retries=30 CMD netstat -ltn | grep -c 8545

ENTRYPOINT ["./entrypoint.sh"]

CMD ["ganache-cli"]
