
all: deploy

init:
	kubectl create ns snake

deploy:
	kubectl -n snake apply -f database_db1.yaml
	kubectl -n snake apply -f database_db2.yaml
	kubectl -n snake apply -f vault_pod.yaml
	kubectl -n snake apply -f backend_pod.yaml
	kubectl -n snake apply -f debian_pod.yaml
	kubectl -n snake apply -f db1_service.yaml
	kubectl -n snake apply -f db2_service.yaml
	kubectl -n snake apply -f vault_service.yaml

undeploy:
	kubectl -n snake delete -f database_db1.yaml
	kubectl -n snake delete -f database_db2.yaml
	kubectl -n snake delete -f vault_pod.yaml
	kubectl -n snake delete -f backend_pod.yaml
	kubectl -n snake delete -f debian_pod.yaml
	kubectl -n snake delete -f db1_service.yaml
	kubectl -n snake delete -f db2_service.yaml
	kubectl -n snake delete -f vault_service.yaml

	
