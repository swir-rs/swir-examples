#!/bin/bash
if ! [ -n "$1" ]; then
    echo "Set accound id for your AWS subscription";
    exit 1
fi

if ! [ -n "$2" ]; then
    echo "Set valid AWS region "
    exit 1
fi

echo "Accout " $1 " region " $2

cd aws-scripts
./aws-populate-registry.sh $1 $2
./aws-create-streams.sh
./aws-create-role.sh 
python3 aws-log-groups.py CREATE
python3 aws-create-deployment.py $1 $2

cd ..
