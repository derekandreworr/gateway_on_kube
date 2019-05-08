pipeline{
agent any
stages {
    stage('Checkout code') {
        steps {
            checkout scm
        }
    }
    stage('Deploy gateway and mysql to MiniKube') {
        steps {
           echo 'starting gateway and mysql'
           sh 'kubectl apply -f container-gateway-config.yml -f container-gateway-mysql.yml -f container-gateway.yml --validate=false'
        }
    }
    stage('Deploy lac to minikube'){
           steps {
            echo 'Starting lac'
            sh 'kubectl apply -f lac-nps.yml --validate=false'
          }
    }

    stage('expose gw via kubectl expose'){
          steps {
           echo 'exposing gateway'
           sh 'kubectl expose deployment gw-dc --type=NodePort'
          }
    }
    stage('get service'){
          steps {
           sh 'kubectl get service'
          }
    }
    stage('get pods'){
          steps {
           sh 'kubectl get pods'
          }
    }
    stage('sleep for a few mins'){
          steps {
           sleep 290
          }
    }
    stage('Push policy to gateway'){
         steps {
          sh 'curl -k -u admin:CAdemo123! -H "Content-Type: application/xml" -X POST -d @lac-policy.xml https://192.168.99.100:31843/restman/1.0/services'
          sleep 5
         }
    }
    stage('call the api'){
         steps {
          sh 'curl -k -u admin:CAdemo123! https://192.168.99.100:31843/lac-policy'
         }  
    }
}
}
