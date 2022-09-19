FROM alpine:3.6

MAINTAINER Hortonworks

ENV HELM_VERSION="v3.9.4"

RUN apk add --update ca-certificates \
 && apk add --update -t deps wget \
 && wget https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && tar -xvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && apk del --purge deps \
 && rm /var/cache/apk/* \
 && rm -f /helm-${HELM_VERSION}-linux-amd64.tar.gz

ENTRYPOINT ["helm"]
CMD ["help"]
