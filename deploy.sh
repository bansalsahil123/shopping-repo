docker build -t shopping:latest ./ShoppinglyX/.
docker build -t shoppingdb:latest ./mysql/.

docker tag shopping:latest us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shopping:$SHA
docker tag shoppingdb:latest us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shoppingdb:$SHA
docker tag shopping:latest us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shopping:v1


docker push us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shopping:$SHA
docker push us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shoppingdb:$SHA
docker push us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shopping:v1

kubectl delete -f k8s/pod-init.yaml
kubectl apply -f k8s

kubectl set image deployments/ecommerce-deployment django=us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shopping:$SHA  
kubectl set image deployments/sql-deployment db=us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shoppingdb:$SHA  
kubectl set image pod/jobpod podjango=us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shopping:$SHA  
