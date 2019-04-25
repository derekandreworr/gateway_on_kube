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
          //sh 'chmod a+x deploy.sh'
          echo 'starting gateway and mysql'
	  sh 'kubectl apply -f container-gateway-config.yml -f container-gateway-mysql.yml -f container-gateway.yml --validate=false'
          //sh './deploy.sh'        
          //echo 'starting gateway and mysql'
	  //sleep 240
         }
    }
    stage('Deploy lac to minikube'){
          echo 'Starting lac'
          sh 'kubectl apply -f lac-nps.yml --validate=false'
    }
    stage('expose gw via kubectl expose'){
          echo 'exposing gateway'
          sh 'kubectl expose deployment gw-dc --type=NodePort'
    }
    stage('get service'){
          sh 'kubectl get service'
    }
    stage('get pods'){
          sh 'kubectl get pods'
    }
    stage('sleep for a few mins'){
          sleep 290
    }
    stage('Push policy to gateway'){
         sh 'curl -k -u admin:CAdemo123! -H "Content-Type: application/xml" -X POST -d @lac-policy.xml https://192.168.99.100:31843/restman/1.0/services'
         sleep 5
    }
    stage('call the api'){
         sh 'curl -k -u admin:CAdemo123! https://192.168.99.100:31843/lac-policy'
    }
}
}
