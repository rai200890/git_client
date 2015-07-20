require 'rest-client'
require 'json'
module GitClient
  class Request

    attr_reader :raw, :url, :params, :response, :errors

    def initialize params={}
      @url = params[:url]
      @params = params[:params]
      @response = params[:response]
      @errors = params[:errors]
      @raw = params[:raw] || false
    end

    def self.get url, params = {}, raw = false
      response = ::RestClient.get(url, params: params)
      Request.new(url: url, params: params, response: response, raw: raw)
    rescue => e
      Request.new(url: url, params: params, errors: e.response, raw: raw)
    end

    def parsed_response
      raw ? response : JSON.parse(response)
    end

    def parsed_errors
      errors ? JSON.parse(errors) : nil
    end


  end
end