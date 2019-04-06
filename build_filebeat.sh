if hash go 2>/dev/null; then
  wd=$(pwd)
  GOPATH="${GOPATH:-$HOME/go}"

  mkdir -p ${GOPATH}/src/github.com/elastic
  git config --global http.sslVerify false
  git clone https://github.com/elastic/beats.git ${GOPATH}/src/github.com/elastic/beats
  cd ${GOPATH}/src/github.com/elastic/beats/filebeat
  git checkout 7.x
  make filebeat
  python ../libbeat/scripts/unpack_dashboards.py --glob="./module/nats/_meta/kibana/7/dashboard/Filebeat-nats-overview.json"
  cp -pr ${GOPATH}/src/github.com/elastic/beats/filebeat ${wd}/build/filebeat

  rm -rf ${GOPATH}/src/github.com/elastic
else
  echo "Go is not installed in the system. Aborting."
fi
