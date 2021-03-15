repoUri="$1.dkr.ecr.$2.amazonaws.com"
echo "${repoUri}"

aws ecr delete-repository --repository-name swir/swir-example-pubsub-java-source --force
aws ecr delete-repository --repository-name swir/swir-example-pubsub-java-processor --force
aws ecr delete-repository --repository-name swir/swir-example-pubsub-python-sink --force
aws ecr delete-repository --repository-name swir/swir-example-pubsub-python-processor --force
aws ecr delete-repository --repository-name swir/swir --force
aws ecr delete-repository --repository-name swir/swir-example-pubsub-aws-configurator --force

docker rmi ${repoUri}/swir/swir-example-pubsub-java-source:v0.4.0
docker rmi ${repoUri}/swir/swir-example-pubsub-java-processor:v0.4.0
docker rmi ${repoUri}/swir/swir-example-pubsub-python-sink:v0.4.0
docker rmi ${repoUri}/swir/swir-example-pubsub-python-processor:v0.4.0
docker rmi ${repoUri}/swir/swir:v0.4.0
docker rmi ${repoUri}/swir/swir-example-pubsub-aws-configurator:v0.4.0

