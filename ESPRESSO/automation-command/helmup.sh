#!/bin/bash
kubectl create namespace s7auriole
echo "----------------------------------------------------------------------------------------------------------------"
kubens s7auriole
helm install shop-product /student_home/ESPRESSOO/ESPRESSO/shop-product
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
helm install shop-web /student_home/ESPRESSOO/ESPRESSO/shop-web 
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
helm install shop-reviews /student_home/ESPRESSOO/ESPRESSO/shop-review 
echo "*********************************************************************************************************************"  
helm install redis-ha-au /student_home/ESPRESSOO/ESPRESSO/redis-ha 
echo "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
helm install postgres-ha-au /student_home/ESPRESSOO/ESPRESSO/postgresql-ha 
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
helm install argo-cd-au /student_home/ESPRESSOO/argo-cd
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
sleep 20
echo "  SERVICES ARE:"
kubectl get svc 
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "PODS ARE:"
kubectl get po        
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
sleep 15
kubectl get po
echo ""
sleep 15
kubectl get all
echo "##############################################################################################################################################################################"
kubectl get nodes -owide 
kubectl get svc | grep -i '8090.*argocd-server\|argocd-server.*8090'

echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
kubectl -n s7auriole get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo


# username: admin    password: prom-operator
