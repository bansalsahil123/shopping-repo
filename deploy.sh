docker build -t shopping:latest ./ShoppinglyX/.


docker tag shopping:latest us-central1-docker.pkg.dev/marine-set-350105/image-repo/shopping:$SHA
docker tag shopping:latest us-central1-docker.pkg.dev/marine-set-350105/image-repo/shopping:v1


docker push us-central1-docker.pkg.dev/marine-set-350105/image-repo/shopping:$SHA



#kubectl delete -f k8s/pod-init.yaml
kubectl apply -f k8s

kubectl autoscale deployment ecommerce-deployment --cpu-percent=50 --min=4 --max=10
kubectl set image deployments/ecommerce-deployment django=us-central1-docker.pkg.dev/marine-set-350105/image-repo/shopping:$SHA  init-django=us-central1-docker.pkg.dev/marine-set-350105/image-repo/shopping:$SHA
