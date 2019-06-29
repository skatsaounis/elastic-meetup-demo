# Elastic Meetup Demo

This repo contains the code needed to create a stack of Elasticsearch, Kibana, NATS, Filebeat and Metricbeat.

Both Metricbeat and Filebeat are configured to have newly introduced NATS module enabled for collecting logs and metrics
from NATS messaging system respectively.

This is part of the demo which took place at the 3d Elastic Athens Meetup (https://www.meetup.com/Greece-Elastic/events/259473881/). 

Furthermore, the presentation can be found here: https://www.slideshare.net/StamatisKatsaounis/monitoring-the-nats-messaging-system-at-scale-with-elastic-beats

## Getting Started

These instructions will get you a deployment of the project up and running on your local machine for development and testing purposes.

### Prerequisites

In order to deploy the stack, Linux OS is required and the following prerequisites must be met.

1) docker (latest version)
2) docker-compose (latest version)

To be able to run the deployment user must belong to sudoers group as well.

### Instructions

```bash
sudo sysctl -w vm.max_map_count=262144
```
This increases the operating system limits on mmap counts as it may be too low,
which may result in out of memory exceptions when running Elasticsearch.

```bash
touch nats.log
```
An empty nats.log file is needed for the container volume sharing.

```bash
sudo docker-compose up
```
This command brings up the stack.

After the stack is up and running visit Kibana in http://localhost:5601 and 
choose a preferred index (filebeat-* or metricbeat-*) to see the related pre-built dashboards already loaded to Kibana 
for nats metricbeat and filebeat.

## Authors

* **Stamatis Katsaounis** - [skatsaounis](https://github.com/skatsaounis)
* **Christos Markou** - [ChrsMark](https://github.com/ChrsMark)
* **Michael Katsoulis** - [MichaelKatsoulis](https://github.com/MichaelKatsoulis)
