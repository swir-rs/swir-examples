#!/bin/bash
kubectl create namespace monitoring
kubectl -n monitoring create configmap prometheus-server-conf --from-file=./prometheus.yml
kubectl -n monitoring create configmap otel-collector-conf --from-file=./otel-collector-config.yaml
kubectl apply -f prometheus-deployment.yaml 
kubectl apply -f otel-collector-deployment.yaml 
kubectl apply -f jaeger-deployment.yaml
#minikube -n monitoring service prometheus 
#minikube -n monitoring service jaeger 
