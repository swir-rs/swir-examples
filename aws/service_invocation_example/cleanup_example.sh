#!/bin/bash

if ! [ -n "$1" ]; then
    echo "Set accound id for your AWS subscription";
    exit 1
fi

if ! [ -n "$2" ]; then
    echo "Set valid AWS region";
    exit 1
fi

if ! [ -n "$3" ]; then
    echo "Set postfix for the cluster you want to delete as printed during ./run_example.sh";
    exit 1
fi



cd aws-scripts

python3 aws-delete-deployment.py $3

python3 aws-log-groups.py DELETE
./aws-delete-table.sh "swir-service-discovery"
./aws-clean-registry.sh $1 $2
./aws-delete-role.sh
cd ..


