# Compile, build and generate necessary docker images
#!/bin/bash
docker-compose -f docker-compose-example-pubsub.yaml -p app down
docker-compose -f docker-compose-infr.yml -p docker down --remove-orphans
docker-compose -f docker-compose-infr.yml -p docker up -d

# Create necessary topics for Kafka
sleep 5

docker exec -t docker_kafka_1 kafka-topics.sh --bootstrap-server :9094 --create --topic processor1_kafka_blue --partitions 2 --replication-factor 1
docker exec -t docker_kafka_1 kafka-topics.sh --bootstrap-server :9094 --create --topic processor3_kafka_red --partitions 2 --replication-factor 1
docker exec -t docker_kafka_1 kafka-topics.sh --bootstrap-server :9094 --create --topic sink1_kafka_green --partitions 2 --replication-factor 1

docker-compose -f docker-compose-example-pubsub.yaml -p app up -d


printf "\n**********************\n"
printf "\nTracing logs can be found \n\n"
printf "\nhttp://127.0.0.1:16686/search\n\n"
printf "\n**********************\n"

sleep 5

#Sidecar logs
docker-compose  -f docker-compose-example-pubsub.yaml -p app logs -ft order-generator order-processor-sidecar inventory-processor-sidecar order-processor-sidecar billing-processor-sidecar shipments-sink-sidecar
docker-compose  -f docker-compose-example-pubsub.yaml -p app logs -ft order-generator order-processor inventory-processor billing-processor shipments-sink

#docker logs app_order-processor-sidecar_1
#docker logs app_shipments-sink-sidecar_1
#docker logs app_billing-processor-sidecar_1
#docker logs app_inventory-processor-sidecar_1
#docker logs app_order-generator-sidecar_1

#Application logs
#docker logs app_order-generator_1
#docker logs app_order-processor_1
#docker logs app_inventory-processor_1
#docker logs app_billing-processor_1
#docker logs app_shipments-sink_1




#clean all
#./cleanup_example.sh



