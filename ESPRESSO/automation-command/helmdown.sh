#!/bin/bash
kubectl delete crd alertmanagerconfigs.monitoring.coreos.com
kubectl delete crd alertmanagers.monitoring.coreos.com
kubectl delete crd podmonitors.monitoring.coreos.com
kubectl delete crd probes.monitoring.coreos.com
kubectl delete crd prometheusagents.monitoring.coreos.com
kubectl delete crd prometheuses.monitoring.coreos.com
kubectl delete crd prometheusrules.monitoring.coreos.com
kubectl delete crd scrapeconfigs.monitoring.coreos.com
kubectl delete crd servicemonitors.monitoring.coreos.com
kubectl delete crd thanosrulers.monitoring.coreos.com
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

