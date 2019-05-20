FROM mongo:4.0.9

RUN apt-get update && apt-get install -y \
    cron

COPY cronjob /etc/cron.d/cronjob
RUN chmod 0644 /etc/cron.d/cronjob

COPY script.sh /script.sh
RUN chmod +x /script.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
