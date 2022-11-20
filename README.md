Note: this has NOTHING to do with pasta, its rather a vanilla app I wrote some time ago.
For up to date Pasta app, see https://github.com/palladius/pasta/ (which i recently upgraded to Rails 7!)

# Synopsis

This is my Vanilla app on Ruby on Rails.
Since we have nothing to do, let's start with a blog and acts_as_votable.
Then we can add the pasta stuff :P

# Actions taken

To get here, I've typed these commands:

    rails new pasta
    bin/rails generate controller Welcome index
    bin/rails generate model Article title:string text:text
    rails db:migrate
    bin/rails generate model Comment commenter:string body:text article:references
    rails db:migrate
    bin/rails generate controller Comments
    # after a while and cleaningh up a bit... and getting to 1.0!
    bin/rails generate migration add_url_to_articles url:string
    bin/rails generate migration add_social_to_comments facebook_id:string twitter_id:string

Tutorial: http://guides.rubyonrails.org/getting_started.html

# Docker

Right now, this is correctly dockerized for DEV (easy and public).

    # Cant guarantee on `latest` or I'd be a serious developer. I checked v1.0.10 and that does work.
    # Repo is here: https://hub.docker.com/r/palladius/ror5pasta-dev/
    docker run -it -p 3000:3000 palladius/ror5pasta-dev

    # on K8s:
    kubectl run rorpasta5-dev --image=palladius/ror5pasta-dev --port 3000

## Docker (PROD - private)

This is trickier. I gave you all the hints to make it work for you: 

   1. take the `.pasta.env.dist` and copy into `.pasta.env`
   2. Set up MySQL with new user/pass/database/ip and set `DATABASE_URL` appropriately on config file. 
   3. Run `rake [db:create|db:seed|assets:precompile]` via `entrypoint.sh`

File a bug if it doesn't work! :) With me it does (code is privately in `gcr.io/`).

