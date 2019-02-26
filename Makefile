TAG?=master-478c97d

build:
	docker build -t stefanprodan/kube-metrics-adapter:$(TAG) . -f Dockerfile

push:
	docker tag stefanprodan/kube-metrics-adapter:$(TAG) quay.io/stefanprodan/kube-metrics-adapter:$(TAG)
	docker push quay.io/stefanprodan/kube-metrics-adapter:$(TAG)
