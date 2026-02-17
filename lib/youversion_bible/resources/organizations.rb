module YouversionBible
  module Resources
    module Organizations
      # GET /organizations
      def organizations(bible_id, accept_language: "en")
        request(
          path: "/organizations",
          query: { bible_id: bible_id },
          headers: { "Accept-Language" => accept_language }
        )
      end

      # GET /organizations/{organization_id}
      def organization(organization_id, accept_language: "en")
        request(
          path: "/organizations/#{escape_path(organization_id)}",
          headers: { "Accept-Language" => accept_language }
        )
      end

      # GET /organizations/{organization_id}/bibles
      def organization_bibles(organization_id, page_size: 100, fields: nil, page_token: nil)
        query = {fields: fields, page_token: page_token }
        if fields.present? && fields.count <= 3
          query.merge!({page_size: page_size}) if page_size.present?
        end
        request(
          path: "/organizations/#{escape_path(organization_id)}/bibles",
          query: query
        )
      end

      private

      def escape_path(str)
        CGI.escape(str.to_s).gsub("+", "%20")
      end
    end
  end
end

