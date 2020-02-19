pipeline {
  environment {
    registry = "hbhagask/ipd-simple-web-app"
    registryCredential = 'dockerhub'
  }
  agent { docker { image 'python:3.7.2' } }
  stages {
    stage('build') {
      steps {
        sh 'pip install -r requirements.txt'
      }
    }
    stage('test') {
      steps {
        echo 'test'
      }
    }
    stage('build docker images') {
      steps {
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('push images') {
      steps {
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('remove unused images') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }   
  }
}
