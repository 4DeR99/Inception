FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/mysqld; \
    chmod 777 /var/run/mysqld

COPY requirements/mariadb/conf/create_db.sh .
RUN mysql_install_db && chmod +x create_db.sh

CMD ["bash", "create_db.sh"]