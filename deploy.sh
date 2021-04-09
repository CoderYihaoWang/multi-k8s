# build images
docker build -t coderyihaowang/multi-client -f ./client/Dockerfile ./client
docker build -t coderyihaowang/multi-server -f ./server/Dockerfile ./server
docker build -t coderyihaowang/multi-worker -f ./worker/Dockerfile ./worker

# push images
docker push coderyihaowang/multi-client
docker push coderyihaowang/multi-server
docker push coderyihaowang/multi-worker

# apply files in k8s
kubectl apply -f k8s

# k8s deployment
kubectl set image deployments/server-deployment server=coderyihaowang/multi-server