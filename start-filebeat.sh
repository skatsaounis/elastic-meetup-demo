#!/bin/sh
until $(curl -sS --fail -o /dev/null "http://kibana:5601/api/status"); do sleep 5; done
mkdir -p /tmp/nats/7/dashboard
cp $HOME/kibana/7/dashboard/Filebeat-nats-overview.json /tmp/nats/7/dashboard/
filebeat -e -d "*" --strict.perms=false
