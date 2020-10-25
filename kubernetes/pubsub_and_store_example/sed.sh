#!/bin/bash

MYVARVALUE1="configs\/buuu\/"
MYVARVALUE2="certs\/buuu\/"
template=$(cat "operator.yaml" | sed "s/configs\/swir/$MYVARVALUE1/g" | sed "s/certs\/swir/$MYVARVALUE2/g")

echo "$template" 


find . -name "*.sh" -exec grep -Hn "docker pull swir/swir:v3" '{}' \; -exec sed -i 's/swir:v0.3.21/swir:v0.3.2/g' {} \;
