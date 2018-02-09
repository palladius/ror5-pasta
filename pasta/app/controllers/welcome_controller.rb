class WelcomeController < ApplicationController


  def index
  	@articles_count = Article.all.count
  	@comments_count = Comment.all.count
  end

end
