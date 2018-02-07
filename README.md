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

Tutorial: http://guides.rubyonrails.org/getting_started.html