#!/bin/bash
./check_env.sh
./minikube_init.sh
kubectl create namespace $1 
#./jaeger_install.sh $1
cd monitoring
./monitoring_install.sh
cd ..



