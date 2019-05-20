FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
    cron

RUN echo "* * * * * echo \"hello\" > /proc/1/fd/1 2>/proc/1/fd/2\n" >> /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab

RUN echo "#!/bin/sh\n/usr/bin/crontab /etc/cron.d/crontab\ncron -f" >> /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
