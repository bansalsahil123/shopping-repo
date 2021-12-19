docker build -t shopping:latest ./ShoppinglyX/.
docker build -t shoppingdb:latest ./mysql/.

docker tag shopping:latest us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shopping:v1
docker tag shoppingdb:latest us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shoppingdb:v1


docker push us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shopping:v1
docker push us-central1-docker.pkg.dev/extended-cinema-334708/image-repo/shoppingdb:v1


kubectl apply -f k8s
