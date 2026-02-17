module YouversionBible
  module Resources
    module Licenses
      # GET /licenses
      # Supports bible_id, developer_id, all_available per docs.
      def licenses(bible_id: nil, all_available: true, developer_id: nil)
        # TODO this one doesn't seem to work with the normal API key, figure out why
        request(
          path: "/licenses",
          query: { all_available: all_available, bible_id: bible_id, developer_id: developer_id }
        )
      end
    end
  end
end

