DOCKERUSER=${DOCKERUSER:-pcm32}

docker build -t $DOCKERUSER/kubespray-deps:v2.3.0 .
docker push $DOCKERUSER/kubespray-deps:v2.3.0 
