# Compile, build and generate necessary docker images
#!/bin/bash

docker-compose -f docker-compose-si-example.yaml -p app down
# Create necessary topics for Kafka

sleep 5

docker-compose -f docker-compose-si-example.yaml -p app up -d


printf "\n**********************\n"
printf "\nTracing logs can be found \n\n"
printf "\nhttp://127.0.0.1:16686/search\n\n"
printf "\n**********************\n"

sleep 5

#Sidecar logs 
docker-compose  -f docker-compose-si-example.yaml -p app logs -ft orchestator_sidecar books_sidecar magazinges_sidecar
docker-compose  -f docker-compose-si-example.yaml -p app logs -ft books magazines orchestrator_app


#clean all
./cleanup_example.sh



