module YouversionBible
  class Configuration
    DEFAULT_BASE_URL = "https://api.youversion.com/v1"

    attr_accessor :app_key, :base_url, :timeout, :open_timeout, :idempotent_retry_limit

    def initialize
      @base_url = DEFAULT_BASE_URL
      @app_key = ENV["YVP_APP_KEY"]
      @timeout = 20
      @open_timeout = 5
      @idempotent_retry_limit = 1
    end
  end
end

