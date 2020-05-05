FROM alpine:3.11

LABEL maintainer="Andreas Kasper <andreas.kasper@goo1.de>"

COPY dump.sh /
COPY import.sh /
RUN apk add --update mysql-client bash openssh-client && rm -rf /var/cache/apk/* && chmod 0755 /dump.sh && chmod 0755 /import.sh
ENTRYPOINT ["/dump.sh"]
