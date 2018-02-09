
prep:
	bin/rails db:migrate

#run-local:#
#	bin/rails s

#create-drkiq-shit:
#	docker volume create --name pasta-postgres
#	#docker volume create --name pasta-redis

docker-compose-setup-db-once:
	docker-compose run --­­user "$(id ­-u):$(id -­g)" pasta rake db:reset
	docker-compose run --­­user "$(id ­-u):$(id -­g)" pasta rake db:migrate

run-local-dev:
	#bundle exec unicorn -c config/unicorn.rb
	rake assets:precompile
	# This might be nasty: if you put it on, it will override whatever config/database.yml says (!!)
	unset DATABASE_URL
	./entrypoint.sh ".pasta.env.dist"

run-local-prod: .pasta.env
#	bundle exec unicorn -c config/unicorn.rb
	RAILS_ENV=production rake assets:precompile
	./entrypoint.sh ".pasta.env"

.pasta.env:
	cp .pasta.env.dist .pasta.env
	@echo "WARNING! Filed .pasta.env created. Please change config vars to adapt to your use. The default file is vulnerable!"

build:
	docker build -t ror5pasta .

docker-run: build
	@echo "Riccardo nota che dev e' alla porta 3000 e prod e alla 8000."
	docker run -p 3000:3000 -it ror5pasta

docker-run-debug: build
	docker run -p 3000:3000 -it ror5pasta bash
