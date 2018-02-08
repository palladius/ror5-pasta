
# preso da: https://stackoverflow.com/questions/11199553/where-to-define-rails-apps-version-number

# idea 1
# module MySite
#   class Application
#     VERSION = "0.0.4-todo-take-from-root"
#     #require File.expand_path('../../VERSION', __FILE__)
#   end
# end



# idea 2
class RicConfiguration
  class << self
    attr_accessor :app_version, :app_name, :app_description, :git_version, :app_commit_repo
  end

#  def file_version
#    f = File.open("./VERSION", "r")
#    return f.read
#  end
  

  #@app_version = "0.1.001manhouse"
  @app_version =`cat ./VERSION`.strip()
  @git_version = `git show --pretty=%H`[0..39]
  @app_name = 'PastaVanillaApp'
  @app_repo_url = 'https://github.com/palladius/ror5-pasta'
  @app_description = 'RoR5 Pasta (goldie RoR 5.0 app by Ricc)'
  @app_commit_repo = "#{ @app_repo_url }/commit/#{ @git_version }"
end