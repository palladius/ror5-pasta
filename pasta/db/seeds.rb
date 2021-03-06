# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

db_seed_ver = '1.0'
db_seed_time = Time.now

if  Article.count > 0
  print "I found already #{Article.count} articles: aborting rake seed which should populate an empty DB..\n"
  exit 0
end


a = Article.create(title: "rake db:Seed v#{db_seed_ver}", text: "Created by rake db:seed v#{db_seed_ver} on #{db_seed_time}", url: "https://github.com/palladius/ror5-pasta/blob/master/pasta/db/seeds.rb")
Comment.create(commenter: 'Riccardo', body: 'whuere geil', article: a )
Comment.create(commenter: 'Kate', body: 'not my favorite', article: a )

b = Article.create(title: 'About this app (pasta)', text: "This is Riccardo Carlesso vanilla app on Rails 3. Every app shall come after this. If you see something which should go in EVERY app pls backport it to this app. Code is here: https://github.com/palladius/ror5-pasta", url: "https://github.com/palladius/ror5-pasta/")
Comment.create(commenter: 'Riccardo', body: 'Can I click on https://github.com/palladius/ror5-pasta ?', article: b )
Comment.create(commenter: 'Nik C', body: 'I jolly well can, my favorite bloke!', article: b )

c = Article.create(title: 'RyanBates article re Nested Models', text: "See: http://railscasts.com/episodes/196-nested-model-form-part-1", url: "http://railscasts.com/episodes/196-nested-model-form-part-1")
Comment.create(commenter: 'Riccardo', body: 'This article is awesome. Pity is from some rails versions ago.', article: c )
Comment.create(commenter: 'Ryan', body: 'Happy to help (plagiarized by Ricc)', article: c )
