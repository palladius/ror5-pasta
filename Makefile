
# copiato da qui: https://runnable.com/docker/rails/dockerize-your-ruby-on-rails-application

docker-build:
	docker build -t demo .

docker-run: docker-build
	docker run -p 3000:3000 demo

# wOt!
create-new-app-under-docker:
	 docker run --rm -v $PWD:/prova123 rails rails new prova123