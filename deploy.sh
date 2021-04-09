# build images
docker build -t coderyihaowang/multi-client:latest coderyihaowang/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t coderyihaowang/multi-server:latest coderyihaowang/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t coderyihaowang/multi-worker:latest coderyihaowang/multi-worker:$SHA -f ./worker/Dockerfile ./worker

# push images
docker push coderyihaowang/multi-client:latest
docker push coderyihaowang/multi-server:latest
docker push coderyihaowang/multi-worker:latest

docker push coderyihaowang/multi-server:$SHA
docker push coderyihaowang/multi-client:$SHA
docker push coderyihaowang/multi-worker:$SHA

# apply files in k8s
kubectl apply -f k8s

# k8s deployment
kubectl set image deployments/server-deployment server=coderyihaowang/multi-server:$SHA
kubectl set image deployments/client-deployment client=coderyihaowang/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=coderyihaowang/multi-worker:$SHA