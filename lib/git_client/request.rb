require 'rest-client'
require 'json'
module GitClient
  class Request

    attr_reader :url, :params, :response, :errors, :code

    def initialize params={}
      @url = params[:url]
      @params = params[:params]
      @response = params[:response]
      @code = params[:code]
      @errors = params[:errors]
    end

    def self.get url, params = {}, raw = false
      response = ::RestClient.get(url, params: params)
      body = raw ? response : JSON.parse(response)
      Request.new(url: url, params: params, response: body)
    rescue => e
      Request.new(errors: JSON.parse(e.response))
    end

  end
end