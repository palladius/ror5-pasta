class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper :all # include all helpers, all the time

  helper_method :add_riccardo_configs

  def add_riccardo_configs
	  @config = RicConfiguration
	  #@app_version = Configuration.app_version
      @foo = "add_riccardo_configs::foobar"
  end

  helper_method :set_variables

  def set_variables
    @app_name = RicConfiguration.app_name 
    @app_version = RicConfiguration.app_version 
    @app_git_version = RicConfiguration.git_version 
    @app_commit_repo = RicConfiguration.app_commit_repo
  end

end
