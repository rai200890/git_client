require_relative "base"
module GitClient
  module Client
    class GitLab < Base

      def api_path
        "#{base_url}/api/v3"
      end

      def project id
        ::GitClient::Request.get("#{api_path}/projects/#{id}", {private_token: private_token})
      end

      def projects params = {}
        ::GitClient::Request.get("#{api_path}/projects/all", {private_token: private_token}.merge(params))
      end

      def user_projects params = {}
        ::GitClient::Request.get("#{api_path}/projects", {private_token: private_token}.merge(params))
      end

      def commits params = {}
        ::GitClient::Request.get("#{api_path}/projects/#{params[:project_id]}/repository/commits",
                                 {private_token: private_token}.merge(params))
      end

      def file params = {}
        ::GitClient::Request.get("#{api_path}/projects/#{params[:project_id]}/repository/blobs/#{params[:commit_sha]}",
                                 {private_token: @private_token, filepath: params[:filepath]}, true)
      end

    end
  end
end