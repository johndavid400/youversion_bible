module YouversionBible
  class Error < StandardError; end
  class ConfigurationError < Error; end

  class ApiError < Error
    attr_reader :status, :body

    def initialize(message, status:, body:)
      super(message)
      @status = status
      @body = body
    end
  end

  class Unauthorized < ApiError; end
  class NotFound < ApiError; end
  class RateLimited < ApiError; end
  class ServerError < ApiError; end
  class BadRequest < ApiError; end
end

