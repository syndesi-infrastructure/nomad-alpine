FROM alpine:3.21

COPY --from=golang:alpine3.21 /usr/local/go/ /usr/local/go/
ENV PATH="/usr/local/go/bin:/root/go/bin:${PATH}"

RUN apk add git make bash build-base linux-headers

RUN git clone --depth 1 --branch v1.9.7 https://github.com/hashicorp/nomad.git

RUN cd nomad && \
    make bootstrap && \
    make dev
