/bin/bash

oc login -u system:admin
REGISTRY_IP=$(oc get svc docker-registry -n default -o template --template={{.spec.clusterIP}})	

oc login -u developer
OPENSHIFT_TOKEN=$(oc whoami -t)

docker login -u developer -p ${OPENSHIFT_TOKEN} ${REGISTY_IP}:5000
docker tag flask-demo:latest ${REGISTRY_IP}:5000/myproject/flask-demo
docker push ${REGISTRY_IP}:5000/myproject/flask-demo
