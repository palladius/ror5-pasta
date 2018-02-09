
# preso da: https://stackoverflow.com/questions/11199553/where-to-define-rails-apps-version-number

class RicConfiguration
  class << self
    attr_accessor :app_version, :app_name, :app_description, :git_version, :app_commit_repo, :app_repo_url, :app_changelog, :app_latest_ver
  end  

  #@app_version = "0.1.001manhouse"
  @app_version =`cat ./VERSION`.strip()
  @git_version = `git show --pretty=%H`[0..39] rescue "Exception! Probably no git installed (#{$!})"
  @app_name = 'PastaVanillaApp'
  @app_repo_url = 'https://github.com/palladius/ror5-pasta'
  @app_description = 'RoR5 Pasta (goldie RoR 5.0 app by Ricc)'
  @app_commit_repo = "#{ @app_repo_url }/commit/#{ @git_version }"

  @app_changelog = `cat ./CHANGELOG`.strip()
  @app_latest_ver = `curl https://raw.githubusercontent.com/palladius/ror5-pasta/master/pasta/VERSION`.strip()

end