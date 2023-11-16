#Get the deployment names format in json
kubectl -n <namespace> get deployment -o json

#Print the columns you want to be shown, for example DEPLOYMENT, CONTAINER_IMAGE, READY_REPLICAS, NAMESPACE

kubectl -n admin2406 get deploy -o custom-columns='DEPLOYMENT:.metadata.name,CONTAINER_IMAGE:.spec.template.spec.containers[0].image,READY_REPLICAS:.status.availableReplicas,NAMESPACE:.metadata.namespace' --sort-by=.metadata.name

