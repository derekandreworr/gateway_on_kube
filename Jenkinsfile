pipeline{
agent any
stages {
    stage('Checkout code') {
        steps {
            checkout scm
        }
    }
    stage('Deploy to MiniKube') {
        steps {
          sh 'chmod a+x deploy.sh'
	  //sh 'kubectl apply -f container-gateway-config.yml -f container-gateway-mysql.yml -f container-gateway.yml --validate=false'
          sh './deploy.sh'        
          //echo 'starting gateway and mysql'
	  //sleep 240
         }
    }
}
}
