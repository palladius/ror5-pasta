# from: https://semaphoreci.com/community/tutorials/dockerizing-a-ruby-on-rails-application
# Use the barebones version of Ruby 2.2.3.
#FROM ruby:2.2.3-slim
# RICC Try: FROM ruby:2.3.3 (vedi: https://github.com/alameenkhader/dockerize-rails-mysql/blob/master/Dockerfile)
# RICC Questo funge, se no vedi sopra:

FROM ruby:2.3-slim

MAINTAINER Riccardo Carlesso <riccardo.carlesso@gmail.com>

# Install dependencies:
# - build-essential: To ensure certain gems can be compiled
# - nodejs: Compile assets
# - libpq-dev: Communicate with postgres through the postgres gem
# - postgresql-client-9.4: In case you want to talk directly to postgres
# Ricc NO postgres: libpq-dev postgresql-client-9.4 
# Riccardo:
#  * git-core curl: git/curl serve per due variabili inizializzazione per il mio vanilla :) 
#  * libmysqlclient-dev mysql-client: Per fare andare MySQL
#  * libsqlite3-dev: Per fare andare sqlite3
RUN apt-get update && apt-get install -qq -y build-essential nodejs libsqlite3-dev mysql-client libmysqlclient-dev git-core curl --fix-missing --no-install-recommends

ENV INSTALL_PATH   /ror5-pasta
# PROD:  .pasta.env
# DEV:   .pasta.env.dist
ENV VARS_FILE  .pasta.env.dist

#Failed to install in my new environemnt.
RUN gem install ruby_dep -v '1.5.0'

# Set an environment variable to store where the app is installed to inside
# of the Docker image.
RUN mkdir -p $INSTALL_PATH

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR $INSTALL_PATH

# Ensure gems are cached and only get updated when they change. This will
# drastically increase build times when your gems do not change.
COPY Gemfile Gemfile
RUN bundle install

# Copy in the application code from your work station at the current directory
# over to the working directory.
COPY . .

RUN echo Riccardo test:     APP_NAME="$APP_NAME"
RUN echo Riccardo test: DATABASE_URL="$DATABASE_URL"

# Provide dummy data to Rails so it can pre-compile assets.
#RUN bundle exec rake RAILS_ENV=production DATABASE_URL=mysql://user:pass@127.0.0.1/dbname SECRET_TOKEN=pickasecuretoken assets:precompile
RUN ./entrypoint.sh $VARS_FILE "bundle exec rake assets:precompile"

# Expose a volume so that nginx will be able to read in assets in production.
VOLUME ["$INSTALL_PATH/public"]

# The default command that gets ran will be to start the Unicorn server.
#CMD bundle exec unicorn -c config/unicorn.rb
CMD ./entrypoint.sh $VARS_FILE
