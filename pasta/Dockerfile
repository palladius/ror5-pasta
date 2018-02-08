# from: https://semaphoreci.com/community/tutorials/dockerizing-a-ruby-on-rails-application

# RICC Questo non va.
# Use the barebones version of Ruby 2.2.3.
#FROM ruby:2.2.3-slim
# RICC Try: FROM ruby:2.3.3 (vedi: https://github.com/alameenkhader/dockerize-rails-mysql/blob/master/Dockerfile)
# RICC Questo funge, se no vedi sopra:

FROM ruby:2.3-slim

# Optionally set a maintainer name to let people know who made this image.
#MAINTAINER Nick Janetakis <nick.janetakis@gmail.com>
MAINTAINER Riccardo Carlesso <riccardo.carlesso@gmail.com>

# Install dependencies:
# - build-essential: To ensure certain gems can be compiled
# - nodejs: Compile assets
# - libpq-dev: Communicate with postgres through the postgres gem
# - postgresql-client-9.4: In case you want to talk directly to postgres
# Ricc NO postgres: libpq-dev postgresql-client-9.4 
# Ricc YES: libmysqlclient-dev libsqlite3-dev  mysql-client libmysqlclient-dev
RUN apt-get update && apt-get install -qq -y build-essential nodejs libsqlite3-dev mysql-client libmysqlclient-dev --fix-missing --no-install-recommends

#Failed to install in my new environemnt.
RUN gem install ruby_dep -v '1.5.0'

# Set an environment variable to store where the app is installed to inside
# of the Docker image.
ENV INSTALL_PATH /pasta
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

RUN echo Riccardo to test env vars check APP_NAME="$APP_NAME"

# Provide dummy data to Rails so it can pre-compile assets.
RUN bundle exec rake RAILS_ENV=production DATABASE_URL=mysql://user:pass@127.0.0.1/dbname SECRET_TOKEN=pickasecuretoken assets:precompile

# Expose a volume so that nginx will be able to read in assets in production.
VOLUME ["$INSTALL_PATH/public"]

# The default command that gets ran will be to start the Unicorn server.
CMD bundle exec unicorn -c config/unicorn.rb

