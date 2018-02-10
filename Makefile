
# copiato da qui: https://runnable.com/docker/rails/dockerize-your-ruby-on-rails-application

docker-build:
	docker build -t ror5pasta-prod .

docker-run: docker-build
	docker run -p 8000:8000 -it ror5pasta-prod

docker-run-bash: docker-build
	docker run -p 8000:8000 -it ror5pasta-prod bash

# wOt!
#create-new-app-under-docker:
#	 docker run --rm -v $PWD:/prova123 rails rails new prova123