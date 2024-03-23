FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y openssl certbot nginx

COPY certbot_script.sh /usr/local/bin/certbot_script.sh

ENTRYPOINT ["/usr/local/bin/certbot_script.sh"]