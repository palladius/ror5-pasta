#!/bin/bash

# This file can be used for:
# 1. run rails app in PROD:                        ./entrypoint.sh .pasta.env                     # not on git as it likely has your passwords
# 2. run rails app in DEV:                         ./entrypoint.sh .pasta.env.dist                # on git
# 3. run any arbitrary command in DEV/PROD         ./entrypoint.sh .pasta.env "rake db:migrate"   # note quotes. Cmd has to be in $2

#set -x

CONFIG_FILE="${1:-.pasta.env.dist}"
COMMAND="${2:-bundle exec unicorn -c config/unicorn.rb}"

if [ ! -f "$CONFIG_FILE" ]; then
	echo "Config file not found: $CONFIG_FILE"
	exit 1
fi

# Note: "source .pasta.env.dist" doesnt work without "export", hence the hack in next line. Help appreciated :)
# Might want to install my Sakura repo from palladius for this to work :) https://github.com/palladius/sakura/tree/master/bin
cat "$CONFIG_FILE" | bin/sakura/remove-comments | bin/sakura/prepend "export" > t.entrypoint.sh && source t.entrypoint.sh
#export DATABASE_URL="mysql2://user:pass@ipaddress:3306/Databasename?encoding=utf8&pool=5&timeout=5000"
#export RAILS_ENV=development
#export WORKER_PROCESSES=1
#export LISTEN_ON="0.0.0.0:3000"
#export APP_NAME="pasta-vanilla-dev"
#export BASIC_AUTH_USER="riccardo"
#export BASIC_AUTH_PASS="ch4ng3me"

echo "==========================================="
echo "Program:     $0 $*"
echo "CONFIG_FILE: $CONFIG_FILE"
echo "COMMAND:     $COMMAND"
echo "- RAILS_ENV:       $RAILS_ENV"
echo "- DATABASE_URL:    $DATABASE_URL"
echo "- BASIC_AUTH_USER: $BASIC_AUTH_USER"
echo "- BASIC_AUTH_PASS: $BASIC_AUTH_PASS"
echo "==========================================="

# bundle install
#bundle exec unicorn -c config/unicorn.rb
$COMMAND

echo "$0 $* [END RET='$?']"