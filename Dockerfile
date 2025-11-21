FROM alpine:latest

RUN apk add --no-cache curl unzip && \
    curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip xray.zip && \
    mv xray /usr/local/bin/xray && \
    chmod +x /usr/local/bin/xray && \
    rm xray.zip LICENSE README.md

COPY config.json /etc/xray/config.json

CMD ["xray", "run", "-c", "/etc/xray/config.json"]
