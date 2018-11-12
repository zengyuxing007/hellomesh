#!/bin/bash

set -eux

docker-compose down
docker-compose up --build -d

sleep 5

docker exec docker_client_1 /bin/bash -c "
set -eux

export HELLOMESH_CTLAPI_ENDPOINT=http://10.2.0.2:8091
while ! nc -z 10.2.0.2 8091; do   
  sleep 1
done

go run src/hellomeshctl/main.go svc apply app1 -f examples/docker/app1/app1-svc.yml
go run src/hellomeshctl/main.go svc apply front -f examples/docker/front/front-svc.yml
curl 'http://10.2.0.4:8500/v1/kv/hosts?token=master&keys=true'
curl 'http://10.2.0.4:8500/v1/catalog/nodes?token=master'
echo -n 'app1-1 envoy config:'
curl 'http://10.2.1.11:8001/config_dump'
echo -n 'app1-2 envoy config:'
curl 'http://10.2.1.12:8001/config_dump'
echo -n 'front envoy config:'
curl 'http://10.2.2.11:8001/config_dump'
"
