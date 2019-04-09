# elastic-meetup-demo

This repo contains the code needed to create a stack of elasticsearch, kibana, nats, filebeat and metricbeat.

Both metricbeat and filebeat are configured to have newly introduced nats-module enabled for collecting logs and metrics
from nats message queue respectively.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

In order to build the stack Linux OS is required and the following prerequisites need to be installed in the system.

1) docker(latest version)
2) docker-compose(latest version)
3) golang
4) gcc
5) python

Also user has to be member of sudoers group.

### Installing

```
bash build_filebeat.sh
sudo sysctl -w vm.max_map_count=262144
touch nats.log
sudo docker-compose up
```
After the stack is up and running visit Kibana in http://localhost:5601 to see the dashboards
created for nats metricbeat and filebeat.

## Authors

* **Stamatis Katsaounis** - [skatsaounis](https://github.com/skatsaounis)
* **Christos Markou** - [ChrsMark](https://github.com/ChrsMark)
* **Michael Katsoulis** - [MichaelKatsoulis](https://github.com/MichaelKatsoulis)
