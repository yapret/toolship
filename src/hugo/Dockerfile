FROM alpine:3.17

WORKDIR /root/hugo

ARG TARGETARCH

RUN apk add --no-cache curl libc6-compat gcompat libstdc++ &&\
    curl https://github.com/gohugoio/hugo/releases/download/v0.118.2/hugo_extended_0.118.2_linux-${TARGETARCH}.tar.gz -Lo hugo.tar.gz &&\
    tar xvzf hugo.tar.gz && mv hugo /usr/local/bin/ && rm -rf * &&\
    apk del --no-cache curl &&\
    ln -s /lib/libc.so.6 /usr/lib/libresolv.so.2

ENTRYPOINT [ "/usr/local/bin/hugo" ]