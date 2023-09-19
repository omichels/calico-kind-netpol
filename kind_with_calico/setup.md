
kind create cluster --config values_kind_with_calico.yaml --name dev

kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/tigera-operator.yaml

kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/custom-resources.yaml

docker pull docker.io/calico/cni:v3.26.1

kind load docker-image docker.io/calico/cni:v3.26.1

watch kubectl get pods -l k8s-app=calico-node -A
