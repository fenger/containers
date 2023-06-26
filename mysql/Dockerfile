FROM mysql:8.0.33

LABEL author="Fenger"

COPY init01.sql init02.sql /var/mysql_sqls/

RUN cat /var/mysql_sqls/init01.sql /var/mysql_sqls/init02.sql >> setup.sql

RUN mv setup.sql /docker-entrypoint-initdb.d/
