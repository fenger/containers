#!/usr/bin/env bash
set -e

# Load libraries
. /opt/bitnami/scripts/liblog.sh

error "will start the create topic script"
/opt/custom_scripts/create_topic.sh &

error "end the create topic script"
