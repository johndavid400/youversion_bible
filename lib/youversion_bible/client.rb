require "excon"
require "json"

require_relative "resources/bibles"
require_relative "resources/highlights"
require_relative "resources/languages"
require_relative "resources/licenses"
require_relative "resources/organizations"
require_relative "resources/verse_of_the_day"

module YouversionBible
  class Client
    def initialize(config = YouversionBible.configuration)
      @config = config
      validate!
    end

    # Mix in resource modules
    include YouversionBible::Resources::Bibles
    include YouversionBible::Resources::Highlights
    include YouversionBible::Resources::Languages
    include YouversionBible::Resources::Licenses
    include YouversionBible::Resources::Organizations
    include YouversionBible::Resources::VerseOfTheDay

    private

    def validate!
      raise ConfigurationError, "YouVersion app_key is required (set config.app_key or ENV['YVP_APP_KEY'])." if @config.app_key.to_s.strip.empty?
      raise ConfigurationError, "base_url is required" if @config.base_url.to_s.strip.empty?
    end

    def request(path:, query: nil, body: nil, headers: {}, method: :get)
      request_headers = default_headers.merge(headers)
      payload = body.nil? ? nil : JSON.generate(body)
      url = @config.base_url + path
      params = query.present? ? query : {}
      connection = Excon.new(url, headers: request_headers, query: params.to_query, body: payload)
      response = connection.request(method: method)
      handle_response(response)
    end

    def default_headers
      {
        "X-YVP-App-Key" => @config.app_key,
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }
    end

    def handle_response(response)
      status = response.status
      raw = response.body.to_s
      parsed = raw.empty? ? nil : (JSON.parse(raw) rescue raw)

      case status
      when 200..299
        parsed
      when 400
        raise BadRequest.new("Bad Request", status: status, body: parsed)
      when 401
        raise Unauthorized.new("Unauthorized (check X-YVP-App-Key)", status: status, body: parsed)
      when 404
        raise NotFound.new("Not Found", status: status, body: parsed)
      when 429
        raise RateLimited.new("Rate Limited", status: status, body: parsed)
      when 500..599
        raise ServerError.new("Server Error", status: status, body: parsed)
      else
        raise ApiError.new("Unexpected response status #{status}", status: status, body: parsed)
      end
    end
  end
end

