require "rails/railtie"

module YouversionBible
  class Railtie < Rails::Railtie
    initializer "youversion_bible.configure" do
      YouversionBible.configure do |config|
        config.app_key ||= ENV["YVP_APP_KEY"]
      end
    end
  end
end
