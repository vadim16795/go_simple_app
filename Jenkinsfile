pipeline {
  environment {
    imagename = "vadim16795/go_simple_app" + ":${GIT_COMMIT[0..6]}"
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Github repo') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'GITHUBKEY', url: 'git@github.com:vadim16795/go_simple_app.git']]])
      }
    }
    stage('Build Docker image') {
      steps {
        script {
          dockerImage = docker.build imagename
        }
      }
    }
  }
    // stage('Push image to Dockerhub') {
    //   steps{
    //     script {
    //       docker.withRegistry( '', registryCredential ){
    //         dockerImage.push()
    //       }
    //     }
    //   }
    // }
    // stage('Remove image from local Docker') {
    //   steps{
    //     sh "docker rmi $imagename"
    //   }
    // }
  post {
    always {
      cleanWs()
    }
  }
}
