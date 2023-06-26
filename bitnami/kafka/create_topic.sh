#!/usr/bin/env bash
set -e

# Load libraries
. /opt/bitnami/scripts/liblog.sh

# Load Kafka environment variables
. /opt/bitnami/scripts/kafka-env.sh

if [[ -z "$START_TIMEOUT" ]]; then
    START_TIMEOUT=600
fi

KAFKA_PORT=9092

# https://github.com/wurstmeister/kafka-docker/blob/master/create-topics.sh
start_timeout_exceeded=false
count=0
step=10
while netstat -lnt | awk '$4 ~ /:'"$KAFKA_PORT"'$/ {exit 1}'; do
    info "waiting for kafka to be ready"
    sleep $step;
    count=$((count + step))
    if [ $count -gt $START_TIMEOUT ]; then
        start_timeout_exceeded=true
        break
    fi
done

if $start_timeout_exceeded; then
    info "Not able to auto-create topic (waited for $START_TIMEOUT sec)"
    exit 1
fi

info "=======>>>> create_topic: start to create the topics."

#exists_topics=$(JMX_PORT='' ${KAFKA_BASE_DIR}/bin/kafka-topics.sh --list --bootstrap-server localhost:9092 )
#info $exists_topics

# Expected format:
#   name:partitions:replicas:cleanup.policy
IFS="${KAFKA_CREATE_TOPICS_SEPARATOR-,}"; for topicToCreate in $KAFKA_CREATE_TOPICS; do
    echo "creating topics: $topicToCreate"
    IFS=':' read -r -a topicConfig <<< "$topicToCreate"
    config=
    if [ -n "${topicConfig[3]}" ]; then
        config="--config=cleanup.policy=${topicConfig[3]}"
    fi

    COMMAND="JMX_PORT='' ${KAFKA_BASE_DIR}/bin/kafka-topics.sh \\
		--create \\
		--bootstrap-server localhost:9092 \\
		--topic ${topicConfig[0]} \\
		--partitions ${topicConfig[1]} \\
		--replication-factor ${topicConfig[2]} \\
		${config} \\
		 &"
    eval "${COMMAND}"
done

info "Finished the topic created."

wait
