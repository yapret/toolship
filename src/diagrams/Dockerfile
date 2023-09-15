FROM python:3.9.7-alpine

RUN pip install diagrams

RUN apk add --no-cache graphviz fontconfig ttf-opensans curl && \
    curl -O https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip \
    && mkdir -p /usr/share/fonts/NotoSansCJKjp \
    && unzip NotoSansCJKjp-hinted.zip -d /usr/share/fonts/NotoSansCJKjp/ \
    && rm NotoSansCJKjp-hinted.zip \
    && fc-cache -fv

ENTRYPOINT ["python"]
CMD ["-c", "print('Pass python script file path as argument to create diagrams')"]