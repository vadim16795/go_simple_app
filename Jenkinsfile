pipeline {
  environment {
    registryCredential='f11cc0be-2ed0-432f-b8e0-8d819a37fcf0'
    imagename = "vadim16795/go_simple_app" + ":${GIT_COMMIT[0..6]}"
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Github repo') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '3979cbb1-d638-4f6a-a4a0-374b6bd10672', url: 'git@github.com:vadim16795/go_simple_app.git']]])
 
      }
    }
    stage('Build Docker image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Push image to Dockerhub') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ){
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove image from local Docker') {
      steps{
        sh "docker rmi $imagename"
        sh "docker image prune --filter label=stage=builder"
      }
    }
  }
}