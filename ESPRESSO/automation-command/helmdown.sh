#!/bin/bash
kubens s7auriole
helm delete shop-product 
helm delete shop-web 
helm delete shop-reviews 
helm delete redis-ha-au
helm delete postgres-ha-au 
helm delete argo-cd-au
echo "---------------------------------------------------------------------------------------------------------------------"
kubectl delete pvc data-postgres-ha-au-postgresql-ha-postgresql-0
kubectl delete pvc data-postgres-ha-au-postgresql-ha-postgresql-1 
kubectl delete pvc data-postgres-ha-au-postgresql-ha-postgresql-2 
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
kubectl delete pv data-postgres-ha-au-postgresql-ha-postgresql-0
kubectl delete pv data-postgres-ha-au-postgresql-ha-postgresql-1 
kubectl delete pv data-postgres-ha-au-postgresql-ha-postgresql-2 
echo "---------------------------------------------------------------------------------------------------------------------"
kubectl delete pvc data-redis-ha-au-server-0 
kubectl delete pvc data-redis-ha-au-master-0
kubectl delete pvc data-redis-ha-au-replicas-0
echo "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
kubectl delete pvc data-redis-ha-au-server-1
kubectl delete pvc data-redis-ha-au-master-1
kubectl delete pvc data-redis-ha-au-replicas-1
echo "----------------------------------------------------------------------------------------------------------------------"
kubectl delete pvc data-redis-ha-au-server-2         
kubectl delete pvc data-redis-ha-au-master-2
kubectl delete pvc data-redis-ha-au-replicas-2
echo "**********************************************************************************************************************"
sleep 20
echo "PODS ARE:"
kubectl get po
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "  SERVICES ARE:"
kubectl get svc 
echo "-------------------------------------------------------------------------------------------------------------------"
echo "  PV ARE:"
kubectl get pv 
echo "#########################################################################################################################"
echo "PVC ARE:"
kubectl get pvc
echo "--------------------------------------------------------------------------------------------------------------------"
kubectl get all | grep s7auriole

