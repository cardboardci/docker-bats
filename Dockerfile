FROM alpine:3.8
COPY rootfs/ /
ARG VERSION=0.4.0

RUN apk add --no-cache --update bash=4.4.19-r1 curl=7.61.1-r1 jq=1.6_rc1-r1
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
LABEL maintainer = "CardboardCI" \
    \
    org.label-schema.schema-version = "1.0" \
    \
    org.label-schema.name = "bats" \
    org.label-schema.version = "${version}" \
    org.label-schema.build-date = "${build_date}" \
    org.label-schema.release= = "CardboardCI version:${version} build-date:${build_date}" \
    org.label-schema.vendor = "cardboardci" \
    org.label-schema.architecture = "amd64" \
    \
    org.label-schema.summary = "Bash Automated Testing System" \
    org.label-schema.description = "Bats is most useful when testing software written in Bash, but you can use it to test any UNIX program" \
    \
    org.label-schema.url = "https://gitlab.com/cardboardci/images/bats" \
    org.label-schema.changelog-url = "https://gitlab.com/cardboardci/images/bats/releases" \
    org.label-schema.authoritative-source-url = "https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/bats" \
    org.label-schema.distribution-scope = "public" \
    org.label-schema.vcs-type = "git" \
    org.label-schema.vcs-url = "https://gitlab.com/cardboardci/images/bats" \
    org.label-schema.vcs-ref = "${vcs_ref}" \