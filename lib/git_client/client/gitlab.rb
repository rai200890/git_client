require_relative "base"
module GitClient
  module Client
    class GitLab < Base

      def api_path
        "#{base_url}/api/v3"
      end

      def project id
        ::RestClient.get "#{api_path}/projects/#{id}", {params: {private_token: private_token}}
      end

      def projects params = {}
        ::RestClient.get "#{api_path}/projects/all", {params: {private_token: private_token}.merge(params)}
      end

      def user_projects
        ::RestClient.get "#{api_path}/projects", {params: {private_token: private_token}.merge(params)}
      end

      def commits params = {}
        ::RestClient.get "#{api_path}/projects/#{params[:project_id]}/repository/commits",
                         {params: {private_token: private_token}.merge(params)}
      end

      def file(params = {})
        ::RestClient.get "#{api_path}/projects/#{params[:project_id]}/repository/blobs/#{params[:commit_sha]}",
                       {params: {private_token: @private_token, filepath: params[:filepath]}}
      end

    end
  end
end