class WelcomeController < ApplicationController


  def index
  	@articles_count = Article.all.count
	@config = RicConfiguration
	#@app_version = RicConfiguration.app_version
  end

end
