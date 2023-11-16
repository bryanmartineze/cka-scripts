############UPGRADE CONTROLPLANE###########

#Update the package manager
apt update -y

#Check how many nodes are in this cluster
kubectl get nodes

#Check available versions
apt-cache madison kubeadm | grep 1.27.0

#unhold the kubeadm package
apt-mark unhold kubeadm

#Install the desired version
apt install -y kubeadm=1.27.0-00

#Check which nodes have pods
kubectl get pods -o wide

#Drain node if it has pods
kubectl drain <nodename> --ignore-daemonsets

#Untaint controlplane if needed

kubectl describe node controlplane | grep Taints
kubectl taint node controlplane node-role.kubernetes.io/control-plane:NoSchedule-

#Check to which level of k8s can be upgraded the cluster
kubeadm upgrade plan

#Apply the upgrade
kubeadm upgrade apply v1.27.0

#Install kubelet 1.27
apt-mark unhold kubelet
apt-cache madison kubelet | grep 1.27.0

#Restart the kubelet agent
systemctl restart kubelet


#########UPGRADE NODE#################

#Check which nodes have pods
kubectl get pods -o wide

#Drain node if it has pods
kubectl drain <nodename> --ignore-daemonsets

#Untaint controlplane if needed
kubectl describe node controlplane | grep Taints
kubectl taint node controlplane node-role.kubernetes.io/control-plane:NoSchedule-

#Install kubelet 1.27
apt-mark unhold kubelet
apt-cache madison kubelet | grep 1.27.0

#Restart the kubelet agent
systemctl restart kubelet

