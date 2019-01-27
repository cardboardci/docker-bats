FROM alpine:3.8
COPY rootfs/ /
ARG VERSION=0.4.0

RUN apk add --no-cache --update bash curl docker make jq git 
RUN curl -o "/tmp/v${VERSION}.tar.gz" -L "https://github.com/sstephenson/bats/archive/v${VERSION}.tar.gz" 
RUN tar -x -z -f "/tmp/v${VERSION}.tar.gz" -C /tmp/
RUN bash "/tmp/bats-${VERSION}/install.sh" /usr/local

CMD ["/usr/local/bin/bats"]