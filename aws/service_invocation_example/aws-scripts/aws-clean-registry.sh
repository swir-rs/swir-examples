aws ecr delete-repository --repository-name swir/swir-example-si-python-http-server --force
aws ecr delete-repository --repository-name swir/swir-example-si-python-grpc-client --force
aws ecr delete-repository --repository-name swir/swir --force
aws ecr delete-repository --repository-name swir/swir-example-si-aws-configurator --force

docker rmi ${repoUri}/swir/swir-example-si-python-http-server:v0.3.2
docker rmi ${repoUri}/swir/swir-example-si-python-grpc-client:v0.3.2
docker rmi ${repoUri}/swir/swir:v0.3.2
docker rmi ${repoUri}/swir/swir-example-si-aws-configurator:v0.3.2

