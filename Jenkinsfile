// pipeline {
//   environment {
//     imagename = "vadim16795/go_simple_app" + ":${GIT_COMMIT[0..6]}"
//     dockerImage = ''
//   }
//   agent any
//   stages {
//     stage('Cloning Github repo') {
//       steps {
//         checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'GITHUBKEY', url: 'git@github.com:vadim16795/go_simple_app.git']]])
//       }
//     }
//     stage('Build Docker image') {
//       steps {
//         script {
//           dockerImage = docker.build(imagename)
//         }
//       }
//     }
//   }
//     // stage('Push image to Dockerhub') {
//     //   steps{
//     //     script {
//     //       docker.withRegistry( '', registryCredential ){
//     //         dockerImage.push()
//     //       }
//     //     }
//     //   }
//     // }
//     // stage('Remove image from local Docker') {
//     //   steps{
//     //     sh "docker rmi $imagename"
//     //   }
//     // }
//   post {
//     always {
//       cleanWs()
//     }
//   }
// }


pipeline {
    agent any
    environment {
        def SONAR_SCANNER = tool 'SonarScanner'
        def PATH = "${env.SONAR_SCANNER}/bin/:${env.PATH}"
        def SONARQUBE_URL = "http://192.168.1.138:9000"
        def SONARQUBE_PROJECT_KEY = "mysuperproject:puperproject"
//        def SONARQUBE_PROJECT_NAME = "mysuperproject"
        def SONARQUBE_TOKEN = "sqa_d0715c393dd4793bcce496c7366900181f039319"
        def VERSION = "${env.GIT_COMMIT[0..6]}"
    }
    stages {
        stage('printenv') {
            steps {
                sh 'printenv'
            }
        }
        stage('show version') {
            steps {
                println(VERSION)
            }
        }
        stage('show baseCommit') {
            steps {
                script {
                    fullCommit = sh(script: "git rev-parse "+ env.GIT_BRANCH, returnStdout: true).trim()[0..6]
                    //jString = StringUtils.substring("abc", 0, 2)
                    println("This is your fullCommit :" + fullCommit)
                    println("fullCommit class: " + fullCommit.getClass())
                    def baseCommit = "${fullCommit[0..6]}"
                    println("This is your baseCommit :" + baseCommit)
                    println("baseCommit class: " + baseCommit.getClass())
                }
            }
        }        
        stage('SonarQube Analysis') {
            steps {
                script {
                    sh "sonar-scanner -Dsonar.host.url=${SONARQUBE_URL}" +
//                            " -Dsonar.projectKey=mysuperproject:puperproject" +
                            " -Dsonar.sources=." +
//                            " -Dsonar.login=sqp_5d2410fa11a519ae4f22df1d36fa292d005b8236"
                            " -Dsonar.login=${SONARQUBE_TOKEN}" +
                            " -Dsonar.projectKey=${SONARQUBE_PROJECT_KEY}" +
                            " -Dsonar.projectVersion=${VERSION}"
//                            " -Dsonar.projectName=${SONARQUBE_PROJECT_NAME}" +
//                            " -Dsonar.sources=."
                }
            }
        }
    }
    post {
      always {
        cleanWs()
      }
    }
}
