module YouversionBible
  class Configuration
    DEFAULT_BASE_URL = "https://api.youversion.com/v1"

    attr_accessor :app_key, :base_url

    def initialize
      @base_url = DEFAULT_BASE_URL
      @app_key = ENV["YVP_APP_KEY"]
    end
  end
end

