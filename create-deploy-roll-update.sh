#First create a deployment using imperative commands
kubectl create deployment nginx-deploy --image=nginx:1.16 --replicas=1 --dry-run=client -o yaml

#Save the deployment in a manfiest
kubectl create deployment nginx-deploy --image=nginx:1.16 --replicas=1 --dry-run=client -o yaml > nginx-deploy_manifest.yaml

#Create the deployment using the manifest
kubectl create -f nginx-deploy_manifest.yaml

#Create the rollout update step to upgrade the image from nginx:1.16 to nginx:1.17
kubectl set image deployment nginx-deploy nginx=nginx:1.17 --record=true

#Check if the rollout update was set correctly
kubectl rollout history deployment nginx-deploy

