
kind create cluster --config values_kind_with_calico.yaml --name dev

echo "It's perfectly normal, that the Nodes will be in state NotReady, as long as no CNI is present"

docker pull docker.io/calico/cni:v3.26.1

kind load docker-image docker.io/calico/cni:v3.26.1

kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/calico.yaml


watch kubectl get pods -l k8s-app=calico-node -A
