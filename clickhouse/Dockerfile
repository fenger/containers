FROM clickhouse/clickhouse-server:23.4.2.11-alpine

LABEL author="Fenger"

# from https://github.com/ClickHouse/ClickHouse/blob/master/docker/server/Dockerfile.alpine
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8 \
    LC_ALL=zh_CN.UTF-8 \
    TZ=Asia/Shanghai

COPY init01.sql init02.sql /var/ch_sqls/

# merge multiple sql files to one
RUN cat /var/ch_sqls/init01.sql \
    /var/ch_sqls/init02.sql \
    >> /setup.sql

#RUN mv setup.sql /docker-entrypoint-initdb.d/

COPY init-db.sh /docker-entrypoint-initdb.d/
