require "youversion_bible/version"
require "youversion_bible/configuration"
require "youversion_bible/errors"
require "youversion_bible/util/query"
require "youversion_bible/client"

require "youversion_bible/resources/bibles"
require "youversion_bible/resources/highlights"
require "youversion_bible/resources/languages"
require "youversion_bible/resources/licenses"
require "youversion_bible/resources/organizations"
require "youversion_bible/resources/verse_of_the_day"

module YouversionBible
  class << self
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def client
      Client.new(configuration)
    end
  end
end

