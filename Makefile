
# copiato da qui: https://runnable.com/docker/rails/dockerize-your-ruby-on-rails-application

VERSION = $(shell cat pasta/VERSION)
APPNAME_PROD = ror5pasta-prod
PROJECT_ID = ric-cccwiki

docker-build:
	docker build -t $(APPNAME_PROD) .

docker-run: docker-build
	docker run -p 8000:8000 -it $(APPNAME_PROD)

docker-run-bash: docker-build
	docker run -p 8000:8000 -it $(APPNAME_PROD) bash

# This only works for me. Ir pushes this to my pvt repo.
# YOu can use this for inspiration to push wherever you want.
# Cool part is that docker tag is inherited by app VERSION which is in `pasta/VERSION`
docker-tag-and-push-riccardo-only:
	# latest local
	docker tag ror5pasta-prod:latest  ror5pasta-prod:$(VERSION)
	# remote name, but still local
	docker tag ror5pasta-prod:latest     gcr.io/ric-cccwiki/ror5pasta-prod:latest
	docker tag ror5pasta-prod:$(VERSION) gcr.io/ric-cccwiki/ror5pasta-prod:$(VERSION)
	# push remotes from locally to properly remote .
	gcloud docker -- push gcr.io/ric-cccwiki/ror5pasta-prod:latest
	gcloud docker -- push gcr.io/ric-cccwiki/ror5pasta-prod:$(VERSION)

docker-run-riccardo-prod-version:
	gcloud docker -- run -p 8000:8000 -it gcr.io/ric-cccwiki/ror5pasta-prod

# wOt!
#create-new-app-under-docker:
#	 docker run --rm -v $PWD:/prova123 rails rails new prova123