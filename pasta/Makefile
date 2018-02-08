
prep:
	bin/rails db:migrate

run-local:
	bin/rails s

#create-drkiq-shit:
#	docker volume create --name pasta-postgres
#	#docker volume create --name pasta-redis

docker-compose-setup-db-once:
	docker-compose run --­­user "$(id ­-u):$(id -­g)" pasta rake db:reset
	docker-compose run --­­user "$(id ­-u):$(id -­g)" pasta rake db:migrate

run-local-v2:
	bundle exec unicorn -c config/unicorn.rb

build:
	docker build -t ror5pasta .

docker-run: build
	docker run -p 3000:3000 -it ror5pasta

docker-run-debug: build
	docker run -p 3000:3000 -it ror5pasta bash
