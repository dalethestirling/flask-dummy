node {
    stage ('Get Code') {
        sh 'whoami'
        git 'https://github.com/dalethestirling/flask-dummy.git'
    }
    stage ('Docker Build') {
        sh 'docker build .'
    }
    stage ('Cluster up') {
        sh 'oc cluster down'
        sh 'oc cluster up'
        sh 'sleep 10'
    }
    stage ('Deploy container to Openshift') {
        sh './util/push.sh'
    }
    stage ('Create Openshit Deploynemt and deploy') {
        sh 'oc create -f list.yaml'
        sh ' sleep 120'
    }
    stage ('TEST') {
        def TEST_URL = sh returnStdout: true, script: 'oc get route flask-dummy -o template  --template={{.spec.host}}'
        println("URI for testing: " + TEST_URL)
        sh './test/unit.py ' + TEST_URL
    }
}
