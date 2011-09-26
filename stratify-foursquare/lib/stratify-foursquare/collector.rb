require 'open-uri'
require 'stratify-foursquare/query'

module Stratify
  module Foursquare
    class Collector < Stratify::Collector
      source "Foursquare"
  
      configuration_fields :user_id => {:type => :string}

      configuration_instructions %q[
        TODO
      ]

      def activities
        query.activities
      end

      def query
        Stratify::Foursquare::Query.new(user_id)
      end
    end
  end
end
