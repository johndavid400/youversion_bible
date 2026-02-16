module YouversionBible
  module Resources
    module Languages
      # GET /languages
      def languages(page_size: nil, fields: nil, page_token: nil, country: nil)
        request(
          method: :get,
          path: "/languages",
          query: { page_size: page_size, fields: fields, page_token: page_token, country: country }
        )
      end

      # GET /languages/{language_id}
      # language_id example: "en" or "sr-Latn"
      def language(language_id)
        request(method: :get, path: "/languages/#{escape_path(language_id)}")
      end

      private

      def escape_path(str)
        CGI.escape(str.to_s).gsub("+", "%20")
      end
    end
  end
end

