FROM cardboardci/ci-core:focal
USER root

ARG DEBIAN_FRONTEND=noninteractive

COPY rootfs/ /
ARG VERSION=0.4.0

RUN apk add --no-cache --update bash=4.4.19-r1 curl=7.61.1-r2 jq=1.6_rc1-r1
RUN curl -o "/tmp/v${VERSION}.tar.gz" -L "https://github.com/sstephenson/bats/archive/v${VERSION}.tar.gz" 
RUN tar -x -z -f "/tmp/v${VERSION}.tar.gz" -C /tmp/
RUN bash "/tmp/bats-${VERSION}/install.sh" /usr/local

CMD ["/usr/local/bin/bats"]

##
## Image Metadata
##
ARG build_date
ARG version
ARG vcs_ref
LABEL maintainer="CardboardCI"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="bats"
LABEL org.label-schema.version="${version}"
LABEL org.label-schema.build-date="${build_date}"
LABEL org.label-schema.release="CardboardCI version:${version} build-date:${build_date}"
LABEL org.label-schema.vendor="cardboardci"
LABEL org.label-schema.architecture="amd64"
LABEL org.label-schema.summary="Bash Automated Testing System"
LABEL org.label-schema.description="Bats is most useful when testing software written in Bash, but you can use it to test any UNIX program"
LABEL org.label-schema.url="https://gitlab.com/cardboardci/images/bats"
LABEL org.label-schema.changelog-url="https://gitlab.com/cardboardci/images/bats/releases"
LABEL org.label-schema.authoritative-source-url="https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/bats"
LABEL org.label-schema.distribution-scope="public"
LABEL org.label-schema.vcs-type="git"
LABEL org.label-schema.vcs-url="https://gitlab.com/cardboardci/images/bats"
LABEL org.label-schema.vcs-ref="${vcs_ref}"