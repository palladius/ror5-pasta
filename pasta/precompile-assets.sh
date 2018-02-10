#!/bin/bash

#bundle exec rake RAILS_ENV=production DATABASE_URL=mysql://user:pass@127.0.0.1/dbname SECRET_TOKEN=pickasecuretoken assets:precompile

# PROD
./entrypoint.sh .pasta.env "bundle exec rake assets:precompile"
# DEV (pointless to compile assets in dev i presume)
#./entrypoint.sh .pasta.env.dist "bundle exec rake assets:precompile"
