class WelcomeController < ApplicationController


  def index
  	@articles_count = Article.all.count

	@config = RicConfiguration
	@app_version = RicConfiguration.app_version
	@app_name = RicConfiguration.app_name
  end

end
