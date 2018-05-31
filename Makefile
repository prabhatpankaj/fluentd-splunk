ifeq ($(origin VERSION), undefined)
	VERSION := $(shell git describe --tags --always --dirty)
endif

build:
	docker build -t prabhatiitbhu/fluentd-splunk .
	docker tag prabhatiitbhu/fluentd-splunk prabhatiitbhu/fluentd-splunk:$(VERSION)

push: build
	docker push prabhatiitbhu/fluentd-splunk:$(VERSION)
	docker push prabhatiitbhu/fluentd-splunk:latest
