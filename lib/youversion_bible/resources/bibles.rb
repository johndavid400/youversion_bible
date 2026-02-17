module YouversionBible
  module Resources
    module Bibles
      # GET /bibles
      def bibles(language_ranges: ["en"], all_available: true, page_size: 100, fields: nil, page_token: nil, license_id: nil)
        query = {
          language_ranges: Array(language_ranges), # encoded as language_ranges[]
          all_available: all_available,
          page_size: page_size,
          fields: fields, # fields[]
          page_token: page_token
        }
        query.merge!({license_id: license_id}) if license_id.present?
        request(
          path: "/bibles",
          query: query
        )
      end

      # GET /bibles/{bible_id}
      def bible(bible_id)
        request(path: "/bibles/#{bible_id}")
      end

      # GET /bibles/{bible_id}/index
      def bible_index(bible_id)
        request(path: "/bibles/#{bible_id}/index")
      end

      # GET /bibles/{bible_id}/passages/{passage_id}
      # passage_id examples: "JHN.3.16", "GEN.1", "MAT.1.1-5" (per docs usage)
      def passage(bible_id:, passage_id:)
        request(path: "/bibles/#{bible_id}/passages/#{escape_path(passage_id)}")
      end

      # GET /bibles/{bible_id}/books
      def books(bible_id)
        request(path: "/bibles/#{bible_id}/books")
      end

      # GET /bibles/{bible_id}/books/{book_id}
      # book_id example: "JHN", "GEN" (USFM)
      def book(bible_id:, book_id:)
        request(path: "/bibles/#{bible_id}/books/#{escape_path(book_id)}")
      end

      # GET /bibles/{bible_id}/books/{book_id}/chapters
      def chapters(bible_id:, book_id:)
        request(path: "/bibles/#{bible_id}/books/#{escape_path(book_id)}/chapters")
      end

      # GET /bibles/{bible_id}/books/{book_id}/chapters/{chapter_id}
      def chapter(bible_id:, book_id:, chapter_id:)
        request(path: "/bibles/#{bible_id}/books/#{escape_path(book_id)}/chapters/#{chapter_id}")
      end

      # GET /bibles/{bible_id}/books/{book_id}/chapters/{chapter_id}/verses
      def verses(bible_id:, book_id:, chapter_id:)
        request(path: "/bibles/#{bible_id}/books/#{escape_path(book_id)}/chapters/#{chapter_id}/verses")
      end

      # GET /bibles/{bible_id}/books/{book_id}/chapters/{chapter_id}/verses/{verse_id}
      def verse(bible_id:, book_id:, chapter_id:, verse_id:)
        request(path: "/bibles/#{bible_id}/books/#{escape_path(book_id)}/chapters/#{chapter_id}/verses/#{verse_id}")
      end

      private

      def escape_path(str)
        # Basic safe escaping for path segments (spaces, etc.)
        CGI.escape(str.to_s).gsub("+", "%20")
      end
    end
  end
end

