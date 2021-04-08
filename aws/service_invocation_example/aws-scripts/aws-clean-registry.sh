repoUri="$1.dkr.ecr.$2.amazonaws.com"
echo "${repoUri}"

aws ecr delete-repository --repository-name swir/swir-example-si-python-http-server --force
aws ecr delete-repository --repository-name swir/swir-example-si-python-grpc-client --force
aws ecr delete-repository --repository-name swir/swir --force
aws ecr delete-repository --repository-name swir/swir-example-si-aws-configurator --force

docker rmi ${repoUri}/swir/swir-example-si-python-http-server:v0.4.0
docker rmi ${repoUri}/swir/swir-example-si-python-grpc-client:v0.4.0
docker rmi ${repoUri}/swir/swir:v0.4.0
docker rmi ${repoUri}/swir/swir-example-si-aws-configurator:v0.4.0

