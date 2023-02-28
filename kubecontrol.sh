####Initialize the Cluster


#On the control plane node, initialize the Kubernetes cluster on the control plane node using kubeadm
sudo kubeadm init --pod-network-cidr 192.168.0.0/16 --kubernetes-version 1.24.0


#Set kubectl access:

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#Test access to cluster:
kubectl get nodes



#Install the Calico Network Add-On
#On the control plane node, install Calico Networking:

kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml


#Check status of the control plane node:

kubectl get nodes

#Join the Worker Nodes to the Cluster
#In the control plane node, create the token and copy the kubeadm join command:

kubeadm token create --print-join-command
#Note: This output will be used as the next command for the worker nodes.



