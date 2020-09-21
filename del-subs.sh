#!/usr/bin/env bash

container=$(docker ps -a | grep -i pulsar | grep "sn-3" | awk '{print $1}')
subs=($(docker exec -it "${container}" bin/pulsar-admin topics subscriptions my-topic-name))

for sub in "${subs[@]}"
do
    :
    echo "Deleting subscription ${sub}"
    docker exec -it "${container}" bin/pulsar-admin topics unsubscribe my-topic-name -s "${sub}"
done
