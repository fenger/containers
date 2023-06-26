FROM bitnami/kafka:3.4.1

LABEL author="Fenger"

USER root

RUN apt-get update && apt-get install -y net-tools \
    && apt-get clean && rm -rf /var/lib/apt/lists /var/cache/apt/archives \
    && mkdir -p /opt/custom_scripts/

COPY init.sh /docker-entrypoint-initdb.d/
COPY create_topic.sh /opt/custom_scripts/

RUN chmod 0755 /opt/custom_scripts/*

USER 1001