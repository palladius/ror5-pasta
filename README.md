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