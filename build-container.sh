DOCKERUSER=${DOCKERUSER:-pcm32}

docker build -t $DOCKERUSER/kubespray-deps:v2.4.0-bastion-fix .
docker push $DOCKERUSER/kubespray-deps:v2.4.0-bastion-fix 
