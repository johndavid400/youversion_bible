module YouversionBible
  module Resources
    module VerseOfTheDay
      # GET /verse_of_the_days
      def verse_of_the_day_calendar
        request(method: :get, path: "/verse_of_the_days")
      end

      # GET /verse_of_the_days/{day}
      # day: 1..365 (or 366)
      def verse_of_the_day(day)
        request(method: :get, path: "/verse_of_the_days/#{day}")
      end
    end
  end
end

