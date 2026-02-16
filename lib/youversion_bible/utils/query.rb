require "cgi"

module YouversionBible
  module Util
    module Query
      module_function

      # Supports:
      # - arrays with bracket notation: language_ranges[]=en&language_ranges[]=es
      # - arrays for fields[] etc
      # - nil values dropped
      def encode(params)
        return "" if params.nil? || params.empty?

        parts = []

        params.each do |key, value|
          next if value.nil?

          if value.is_a?(Array)
            value.each do |v|
              next if v.nil?
              parts << "#{CGI.escape("#{key}[]")}=#{CGI.escape(v.to_s)}"
            end
          else
            parts << "#{CGI.escape(key.to_s)}=#{CGI.escape(value.to_s)}"
          end
        end

        parts.join("&")
      end
    end
  end
end

