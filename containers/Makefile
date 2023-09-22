all:	
	docker build . --file Dockerfile.db1 -t nginx-net-policy:db1
	docker build . --file Dockerfile.db2 -t nginx-net-policy:db2
	docker build . --file Dockerfile.vault -t nginx-net-policy:vault

tag:
	docker tag nginx-net-policy:db1   olivermichelsaldisued/nginx-net-policy:db1
	docker tag nginx-net-policy:db2   olivermichelsaldisued/nginx-net-policy:db2
	docker tag nginx-net-policy:vault olivermichelsaldisued/nginx-net-policy:vault
	docker tag nginx-net-policy:8080  olivermichelsaldisued/nginx-net-policy:8080

push:
	docker push olivermichelsaldisued/nginx-net-policy:db1
	docker push olivermichelsaldisued/nginx-net-policy:db2
	docker push olivermichelsaldisued/nginx-net-policy:vault
	docker push olivermichelsaldisued/nginx-net-policy:8080


kind-load:
	kind load docker-image  olivermichelsaldisued/nginx-net-policy:8080
