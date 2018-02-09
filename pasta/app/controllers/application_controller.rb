class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper :all # include all helpers, all the time
  before_action :set_variables_from_app_controller

  #helper_method :add_riccardo_configs

  #def add_riccardo_configs
#	  @config = RicConfiguration#
#	  #@app_version = Configuration.app_version
#      @foo = "add_riccardo_configs::foobar"
#  end

#  helper_method :set_variables

  def set_variables_from_app_controller
    @app_name = RicConfiguration.app_name 
    @app_version = RicConfiguration.app_version 
    @app_repo_url = RicConfiguration.app_repo_url 
    @app_description = RicConfiguration.app_description 
    @app_git_version = RicConfiguration.git_version 
    @app_commit_repo = RicConfiguration.app_commit_repo
    @app_changelog = RicConfiguration.app_changelog
    @app_latest_ver = RicConfiguration.app_latest_ver
    @foo = 'ApplicationController::set_variables_from_app_controller'
  end

end
