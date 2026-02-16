module YouversionBible
  module Resources
    module Licenses
      # GET /licenses
      # Supports bible_id, developer_id, all_available per docs.
      def licenses(bible_id: nil, developer_id: nil, all_available: nil)
        request(
          method: :get,
          path: "/licenses",
          query: { bible_id: bible_id, developer_id: developer_id, all_available: all_available }
        )
      end
    end
  end
end

