module YouversionBible
  module Resources
    module Organizations
      # GET /organizations
      def organizations(bible_id: nil, accept_language: "en")
        request(
          method: :get,
          path: "/organizations",
          query: { bible_id: bible_id },
          headers: { "Accept-Language" => accept_language }
        )
      end

      # GET /organizations/{organization_id}
      def organization(organization_id, accept_language: "en")
        request(
          method: :get,
          path: "/organizations/#{escape_path(organization_id)}",
          headers: { "Accept-Language" => accept_language }
        )
      end

      # GET /organizations/{organization_id}/bibles
      def organization_bibles(organization_id, page_size: nil, fields: nil, page_token: nil)
        request(
          method: :get,
          path: "/organizations/#{escape_path(organization_id)}/bibles",
          query: { page_size: page_size, fields: fields, page_token: page_token }
        )
      end

      private

      def escape_path(str)
        CGI.escape(str.to_s).gsub("+", "%20")
      end
    end
  end
end

