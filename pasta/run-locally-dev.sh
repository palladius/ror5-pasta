#!/bin/bash

set -x

# Development:

export SECRET_TOKEN="928e25bf4f37072260a4d128b55316f7072f2ffd1fec41e936839803961a9b4dfc6efb0f5ace36b48034478af72a318b06530dcf04c5406db4cdc598bf307d7a"
#export DATABASE_URL="mysql2://user:pass@ipaddress:3306/Databasename?encoding=utf8&pool=5&timeout=5000"
export RAILS_ENV=development
export WORKER_PROCESSES=1
export LISTEN_ON="0.0.0.0:3000"
export APP_NAME="pasta-vanilla-dev"
export BASIC_AUTH_USER="riccardo"
export BASIC_AUTH_PASS="ch4ng3me"

# bundle install
bundle exec unicorn -c config/unicorn.rb
