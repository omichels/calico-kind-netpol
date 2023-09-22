all:	
	docker build . --file Dockerfile.db1 -t nginx-net-policy:db1
	docker build . --file Dockerfile.db2 -t nginx-net-policy:db2
	docker build . --file Dockerfile.vault -t nginx-net-policy:vault
	docker build . --file Dockerfile.nginx8080 -t nginx-net-policy:8080

GENERICPORT = 9090
9090:
	sed  "s/GENERICPORT/$(GENERICPORT)/g" default-GENERIC.conf > default_.conf
	sed  "s/GENERICPORT/$(GENERICPORT)/g" Dockerfile.nginx-generic_ > Dockerfile.nginx-generic 
	docker build . --file Dockerfile.nginx-generic -t nginx-net-policy:9090
	docker tag nginx-net-policy:9090 olivermichelsaldisued/nginx-net-policy:9090
	docker push olivermichelsaldisued/nginx-net-policy:9090
	kind load docker-image olivermichelsaldisued/nginx-net-policy:9090

GENERICPORT = 1111
1111:
	sed  "s/GENERICPORT/$(GENERICPORT)/g" default-GENERIC.conf > default_.conf
	sed  "s/GENERICPORT/$(GENERICPORT)/g" Dockerfile.nginx-generic_ > Dockerfile.nginx-generic 
	docker build . --file Dockerfile.nginx-generic -t nginx-net-policy:1111
	docker tag nginx-net-policy:1111 olivermichelsaldisued/nginx-net-policy:1111
	docker push olivermichelsaldisued/nginx-net-policy:1111
	kind load docker-image olivermichelsaldisued/nginx-net-policy:1111

81:
	sed  's/GENERICPORT/81/g' default-GENERIC.conf > default_.conf
	docker build . --file Dockerfile.nginx-generic -t nginx-net-policy:81
	docker tag nginx-net-policy:81 olivermichelsaldisued/nginx-net-policy:81
	docker push olivermichelsaldisued/nginx-net-policy:81
	kind load docker-image olivermichelsaldisued/nginx-net-policy:81

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
