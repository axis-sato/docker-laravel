ARG MYSQL_VERSION

FROM mysql:${MYSQL_VERSION}

COPY my.cnf /etc/mysql/conf.d/my.cnf

RUN cp -p /usr/share/zoneinfo/Japan /etc/localtime