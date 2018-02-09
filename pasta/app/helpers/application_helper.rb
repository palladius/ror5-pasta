module ApplicationHelper

  #helper_method :set_variables_from_helper
  #before_filter obsoleted by before_action:
  #before_action :set_variables

  def set_variables_from_helper
#    @app_name = RicConfiguration.app_name 
#    @app_version = RicConfiguration.app_version 
#    @app_git_version = RicConfiguration.git_version 
#    @app_commit_repo = RicConfiguration.app_commit_repo
    @foo = 'ApplicationHelper::set_variables_from_helper'
  end

end
