# Bitnami kafka
Build image based on [bitnami kafka](https://github.com/bitnami/containers/tree/main/bitnami/kafka), which can create initialization topics, refer to [wurstmeister/kafka-docker](https://github.com/wurstmeister/kafka-docker)

# Usage

## Build
```
docker build -t my-kafka:v1 .
```

## Run
```bash
docker run -d --name mykafka \
    -e START_TIMEOUT=100 \
    -e KAFKA_CREATE_TOPICS_SEPARATOR=, \
    -e KAFKA_CREATE_TOPICS=topic01:8:1:delete,topic02:8:1:delete \
    -e ALLOW_PLAINTEXT_LISTENER=yes \
    my-kafka:v1
```

## Check
```bash
[root@localhost ~]# docker exec -it mykafka bash
I have no name!@141e04033ced:/$ cd /opt/bitnami/kafka/bin
I have no name!@141e04033ced:/opt/bitnami/kafka/bin$ ./kafka-topics.sh --bootstrap-server 127.0.0.1:9092 --list
topic01
topic02
I have no name!@141e04033ced:/opt/bitnami/kafka/bin$ 
```
