repoUri="$1.dkr.ecr.$2.amazonaws.com"
echo "${repoUri}"
aws ecr get-login-password --region $2 | docker -v login --username AWS --password-stdin "${repoUri}"

aws ecr create-repository --repository-name swir/swir-example-si-aws-configurator
docker tag swir/swir-example-si-aws-configurator:v0.4.0 ${repoUri}/swir/swir-example-si-aws-configurator:v0.4.0
docker push ${repoUri}/swir/swir-example-si-aws-configurator:v0.4.0

aws ecr create-repository --repository-name swir/swir-example-si-python-http-server
docker tag swir/swir-example-si-python-http-server:v0.4.0 ${repoUri}/swir/swir-example-si-python-http-server:v0.4.0
docker push ${repoUri}/swir/swir-example-si-python-http-server:v0.4.0

aws ecr create-repository --repository-name swir/swir-example-si-python-grpc-client
docker tag swir/swir-example-si-python-grpc-client:v0.4.0 ${repoUri}/swir/swir-example-si-python-grpc-client:v0.4.0
docker push ${repoUri}/swir/swir-example-si-python-grpc-client:v0.4.0

aws ecr create-repository --repository-name swir/swir
docker tag swir/swir:v0.4.0 ${repoUri}/swir/swir:v0.4.0
docker push ${repoUri}/swir/swir:v0.4.0


#docker -v logout "${repoUri}"
#aws ecr delete-repository --repository-name $1

