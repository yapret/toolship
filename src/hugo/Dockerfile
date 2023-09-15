FROM alpine:3.15

WORKDIR /root/hugo

ARG TARGETARCH

RUN apk add --no-cache curl libc6-compat libstdc++ &&\
    curl https://github.com/gohugoio/hugo/releases/download/v0.118.2/hugo_0.118.2_linux-${TARGETARCH}.tar.gz -Lo hugo.tar.gz &&\
    tar xvzf hugo.tar.gz && mv hugo /usr/local/bin/ && rm -rf * &&\
    apk del --no-cache curl

ENTRYPOINT [ "/usr/local/bin/hugo" ]