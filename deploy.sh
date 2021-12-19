docker build -t shopping:latest ./ShoppinglyX/.
docker build -t shoppingdb:latest ./mysql/.

docker tag shopping:latest us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shopping:$SHA
docker tag shoppingdb:latest us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shoppingdb:$SHA


docker push us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shopping:$SHA
docker push us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shoppingdb:$SHA


kubectl apply -f k8s
kubectl set image deployments/ecommerce-deployment django=us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shopping:$SHA  init-django=us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shopping:$SHA
