FROM alpine:3.11

RUN apk update && apk add ssmtp

RUN mkdir /app

COPY src/. /app

CMD ["sh", "/app/sendmail.sh"]