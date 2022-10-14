FROM alpine:3.11

RUN apk add --no-cache bash curl jq

ADD entrypoint.sh /entrypoint.sh
ADD src /src
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
