FROM alpine:3.9.4

COPY entrypoint.sh /
COPY script.sh /
RUN chmod +x /entrypoint.sh
RUN chmod +x /script.sh
ENTRYPOINT [ "/entrypoint.sh" ]
