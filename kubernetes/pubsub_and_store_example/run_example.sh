#!/bin/bash
if ! [ -n "$1" ]; then
    echo "Provide namespace for deployment"
    exit 1
fi

deployment_name=$1
operator_namespace=$2


if ! [ -n "$2" ]; then
    echo "Provide namespace for operator to use"
    operator_namespace="$deployment_name-op"
fi

echo "Deployment namespace $deployment_name operator namespace $operator_namespace"

cwd=$(pwd)
cd ..
./setup.sh $deployment_name
cd $cwd
./swir_operator_install.sh $operator_namespace $deployment_name 
./deploy_infrastructure.sh 
./deploy_example.sh $deployment_name

printf "\n\n************************************\n\n"
printf "\n\nTo check logs run: \n\n "
printf "\n./display_source_logs.sh %s \n" $deployment_name
printf "\n./display_sink_logs.sh %s \n" $deployment_name
printf "\n\n************************************\n\n"

../tracing_dashboard.sh $deployment_name


