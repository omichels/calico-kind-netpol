all: build tag push kind-load

build:	
	docker build . --file Dockerfile.db1 -t nginx-net-policy:db1
	docker build . --file Dockerfile.db2 -t nginx-net-policy:db2
	docker build . --file Dockerfile.vault -t nginx-net-policy:vault
	docker build . --file Dockerfile.debian -t debian:curl

tag:
	docker tag nginx-net-policy:db1   olivermichelsaldisued/nginx-net-policy:db1
	docker tag nginx-net-policy:db2   olivermichelsaldisued/nginx-net-policy:db2
	docker tag nginx-net-policy:vault olivermichelsaldisued/nginx-net-policy:vault
	docker tag debian:curl            olivermichelsaldisued/debian:curl

push:
	docker push olivermichelsaldisued/nginx-net-policy:db1
	docker push olivermichelsaldisued/nginx-net-policy:db2
	docker push olivermichelsaldisued/nginx-net-policy:vault
	docker push olivermichelsaldisued/debian:curl


kind-load:
	kind load docker-image olivermichelsaldisued/nginx-net-policy:db1
	kind load docker-image olivermichelsaldisued/nginx-net-policy:db2
	kind load docker-image olivermichelsaldisued/nginx-net-policy:vault
	kind load docker-image olivermichelsaldisued/debian:curl


remove:
	bash ./remove.sh
