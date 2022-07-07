pipeline {
    agent any 
    stages {
        stage('Cloning Github repo') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '3979cbb1-d638-4f6a-a4a0-374b6bd10672', url: 'git@github.com:vadim16795/go_simple_app.git']]])
            }
        }
    }
}