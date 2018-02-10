# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...

# Installation

* Clone this repo
* copy `.pasta.env.dist` into `.pasta.env`. Tweak vars, particularly note that PROD needs MySQL to run so you need to set up one mysql instance somewhere.

# Development

* push

    # Tagging
    docker tag ror5pasta:latest gcr.io/ric-cccwiki/ror5pasta:latest
    docker tag ror5pasta:latest gcr.io/ric-cccwiki/ror5pasta:1.0.9
    docker tag ror5pasta:latest palladius/ror5pasta:1.0.9
    docker tag ror5pasta:latest palladius/ror5pasta:latest
    #nope docker push palladius/ror5pasta:latest

    # Private:
    gcloud docker -- push gcr.io/ric-cccwiki/ror5pasta:latest

    # Public
    export DOCKER_ID_USER="palladius"
    docker push palladius/ror5pasta:latest

   Bug: Bundler::GemNotFound: Could not find i18n-0.9.3 in any of the sources

# Bug002

Only happens with PROD (mysql2):

bundler: failed to load command: rake (/usr/local/bundle/bin/rake)
Bundler::GemNotFound: Could not find i18n-0.9.3 in any of the sources
  /usr/local/lib/ruby/site_ruby/2.3.0/bundler/spec_set.rb:88:in `block in materialize'
  /usr/local/lib/ruby/site_ruby/2.3.0/bundler/spec_set.rb:82:in `map!'
  /usr/local/lib/ruby/site_ruby/2.3.0/bundler/spec_set.rb:82:in `materialize'
  /usr/local/lib/ruby/site_ruby/2.3.0/bundler/definition.rb:170:in `specs'
  /usr/local/lib/ruby/site_ruby/2.3.0/bundler/definition.rb:237:in `specs_for'
  /usr/local/lib/ruby/site_ruby/2.3.0/bundler/definition.rb:226:in `requested_specs'
  /usr/local/lib/ruby/site_ruby/2.3.0/bundler/runtime.rb:108:in `block in definition_method'
  /usr/local/lib/ruby/site_ruby/2.3.0/bundler/runtime.rb:20:in `setup'
  /usr/local/lib/ruby/site_ruby/2.3.0/bundler.rb:107:in `setup'
  /usr/local/lib/ruby/site_ruby/2.3.0/bundler/setup.rb:20:in `<top (required)>'
  /usr/local/lib/ruby/site_ruby/2.3.0/rubygems/core_ext/kernel_require.rb:59:in `require'
  /usr/local/lib/ruby/site_ruby/2.3.0/rubygems/core_ext/kernel_require.rb:59:in `require'
./entrypoint.sh .pasta.env bundle exec rake assets:precompile [END RET='1']
