require "git_client/client/base"
require "git_client/client/gitlab"
require "git_client/client/github"
module GitClient
  class GitClient

    PROVIDERS = {github: Client::GitHub, gitlab: Client::GitLab}

    attr_reader :client

    def self.supported_providers
      PROVIDERS.keys
    end

    def initialize(params = {})
      @client = PROVIDERS[params[:provider]].new params
    end

  end
end