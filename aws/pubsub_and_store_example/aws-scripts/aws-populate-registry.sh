repoUri="$1.dkr.ecr.$2.amazonaws.com"
echo "${repoUri}"
aws ecr get-login-password --region $2 | docker -v login --username AWS --password-stdin "${repoUri}"

aws ecr create-repository --repository-name swir/swir-example-pubsub-java-source
docker tag swir/swir-example-pubsub-java-source:v0.4.0 ${repoUri}/swir/swir-example-pubsub-java-source:v0.4.0
docker push ${repoUri}/swir/swir-example-pubsub-java-source

aws ecr create-repository --repository-name swir/swir-example-pubsub-java-processor
docker tag swir/swir-example-pubsub-java-processor:v0.4.0 ${repoUri}/swir/swir-example-pubsub-java-processor:v0.4.0
docker push ${repoUri}/swir/swir-example-pubsub-java-processor

aws ecr create-repository --repository-name swir/swir-example-pubsub-python-sink
docker tag swir/swir-example-pubsub-python-sink:v0.4.0 ${repoUri}/swir/swir-example-pubsub-python-sink:v0.4.0
docker push ${repoUri}/swir/swir-example-pubsub-python-sink

aws ecr create-repository --repository-name swir/swir-example-pubsub-python-processor
docker tag swir/swir-example-pubsub-python-processor:v0.4.0 ${repoUri}/swir/swir-example-pubsub-python-processor:v0.4.0
docker push ${repoUri}/swir/swir-example-pubsub-python-processor

aws ecr create-repository --repository-name swir/swir
docker tag swir/swir:v0.4.0 ${repoUri}/swir/swir:v0.4.0
docker push ${repoUri}/swir/swir:v0.4.0

aws ecr create-repository --repository-name swir/swir-example-pubsub-aws-configurator
docker tag swir/swir-example-pubsub-aws-configurator:v0.4.0 ${repoUri}/swir/swir-example-pubsub-aws-configurator:v0.4.0
docker push ${repoUri}/swir/swir-example-pubsub-aws-configurator


#docker -v logout "${repoUri}"
#aws ecr delete-repository --repository-name $1

