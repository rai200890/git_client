require "git_client/request"
module GitClient
  module Client
    class Base

      attr_reader :base_url, :private_token

      def initialize(params = {})
        @base_url = params[:base_url]
        @private_token =  params[:private_token]
      end

    end
  end
end