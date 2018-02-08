module ApplicationHelper


  #helper_method :set_variables

  def set_variables
    @app_name = RicConfiguration.app_name 
    @app_version = RicConfiguration.app_version 
    @app_git_version = RicConfiguration.git_version 
    @app_commit_repo = RicConfiguration.app_commit_repo
  end

end
