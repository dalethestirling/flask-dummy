pipeline {
    agent any
    
    stages {
        stage ('Docker Build') {
            steps {
                sh 'cd /Users/dstirling/blog ; docker build .'
            }
        }
        stage ('Cluster up') {
            steps {
                sh 'oc cluster up'
            }
        }
    }
}
