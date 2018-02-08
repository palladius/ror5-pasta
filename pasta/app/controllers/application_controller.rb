class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  
  def index
	  @config = Configuration
	  @app_version = Configuration.app_version
      @foo = "index43"
  end

end
