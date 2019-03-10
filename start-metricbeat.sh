#!/bin/sh
until $(curl -sS --fail -o /dev/null "http://kibana:5601/api/status"); do sleep 5; done
mkdir -p /tmp/nats/7/dashboard
cp $HOME/kibana/7/dashboard/Metricbeat-nats-overview.json /tmp/nats/7/dashboard/
metricbeat -e -d "*" --strict.perms=false
