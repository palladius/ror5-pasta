#############################################################
# PROD Dockerfile (secret - MySQL)
#############################################################

FROM ruby:2.3-slim

MAINTAINER Riccardo Carlesso <riccardo.carlesso@gmail.com>

RUN apt-get update && apt-get install -qq -y build-essential nodejs libsqlite3-dev mysql-client libmysqlclient-dev git-core curl --fix-missing --no-install-recommends

ENV INSTALL_PATH   /ror5-pasta-prod
ENV VARS_FILE      .pasta.env

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
COPY pasta/Gemfile Gemfile
RUN bundle install

# Copy in the application code from your work station at the current directory
# over to the working directory.
COPY pasta/ .
RUN bundle install

RUN echo Riccardo test:     APP_NAME="$APP_NAME"
RUN echo Riccardo test: DATABASE_URL="$DATABASE_URL"

RUN ./entrypoint.sh $VARS_FILE "bundle exec rake assets:precompile"

# Expose a volume so that nginx will be able to read in assets in production.
VOLUME ["$INSTALL_PATH/public"]

# The default command that gets ran will be to start the Unicorn server.
#CMD bundle exec unicorn -c config/unicorn.rb
#CMD ./precompile-assets.sh
CMD ./entrypoint.sh $VARS_FILE "bundle exec rake assets:precompile"
CMD ./entrypoint.sh $VARS_FILE
