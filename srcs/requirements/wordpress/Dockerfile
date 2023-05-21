FROM debian:stable

RUN apt-get update && apt-get upgrade -y && apt-get install -y  php7.4 php7.4-fpm php7.4-mysql php7.4-curl wget curl && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php/ && \
    sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|g" /etc/php/7.4/fpm/pool.d/www.conf

COPY conf/create.sh /tmp/

RUN chmod u+x /tmp/create.sh

WORKDIR /var/www

EXPOSE 9000

CMD ["bash", "/tmp/create.sh"]