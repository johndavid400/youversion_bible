module YouversionBible
  module Resources
    module Highlights
      # GET /highlights?bible_id=...&passage_id=...
      def highlights(bible_id:, passage_id:)
        request(
          method: :get,
          path: "/highlights",
          query: { bible_id: bible_id, passage_id: passage_id }
        )
      end

      # POST /highlights  { bible_id, passage_id, color }
      # color must be 6-char hex like "44aa44"
      def upsert_highlight(bible_id:, passage_id:, color:)
        request(
          method: :post,
          path: "/highlights",
          body: { bible_id: bible_id, passage_id: passage_id, color: color }
        )
      end

      # DELETE /highlights/{passage_id_path}?bible_id=...
      def clear_highlights(bible_id:, passage_id:)
        request(
          method: :delete,
          path: "/highlights/#{escape_path(passage_id)}",
          query: { bible_id: bible_id }
        )
      end

      private

      def escape_path(str)
        CGI.escape(str.to_s).gsub("+", "%20")
      end
    end
  end
end

