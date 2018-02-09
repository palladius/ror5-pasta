class WelcomeController < ApplicationController


  def index
  	@articles_count = Article.all.count
  end

end
