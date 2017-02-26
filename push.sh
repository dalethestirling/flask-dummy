#! /bin/bash

oc login -u system:admin
REGISTRY_IP=$(oc get svc docker-registry -n default -o template --template={{.spec.clusterIP}})	

echo "Have registry IP: ${REGISTRY_IP}"

oc login -u developer
OPENSHIFT_TOKEN=$(oc whoami -t)

echo "Have token: ${OPENSHIFT_TOKEN}"

docker login -u developer -p ${OPENSHIFT_TOKEN} ${REGISTRY_IP}:5000
docker tag flask-demo:latest ${REGISTRY_IP}:5000/myproject/flask-demo
docker push ${REGISTRY_IP}:5000/myproject/flask-demo:latest
