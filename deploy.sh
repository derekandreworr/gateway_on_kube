echo INFO: Deploying Gateway and MySQL
sudo kubectl apply -f container-gateway-config.yml -f container-gateway-mysql.yml -f container-gateway.yml --validate=false
sleep 5

echo INFO: Deploying Live API Creator
sudo kubectl apply -f lac-nps.yml --validate=false
sleep 5

echo INFO: Exposing Gateway ports
sudo kubectl expose deployment gw-dc --type=NodePort

echo   
echo kubectl get service
sudo kubectl get service

echo  
echo kubectl get pods
sudo kubectl get pods

#echo
#echo gcloud compute instances list
#gcloud compute instances list


echo INFO: Please wait for Gateway to start...
sleep 260
curl -k -u admin:CAdemo123! -H "Content-Type: application/xml" -X POST -d @lac-policy.xml https://192.168.99.100:31843/restman/1.0/services

sleep 5


#echo INFO: Calling the deployed gateway service to proxy to Live API Creator!
#curl -k -u admin:CAdemo123! https://192.168.99.100:31843/lac-policy

