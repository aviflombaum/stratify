require 'foursquare'

module Stratify
  module Foursquare
    class Query
      attr_reader :user_id

      def initialize(user_id)
        @user_id = user_id
      end

      def activities
        raw_activities.map {|raw_activity| build_activity_from_raw_data(raw_activity)}
      end

      private

      def raw_activities
        client = Foursquare2::Client.new(:oauth_token => 'TODO')
        client.user(@user_id)
        client.user_checkins
      end

      def build_activity_from_raw_data(data)
        Stratify::Foursquare::Activity.new({
          # :checkin_id => extract_id_from_checkin_url(data.url),
          # :spot_name => data.spot.name,
          # :spot_city_state => data.spot.city_state,
          # :spot_latitude => data.spot.lat,
          # :spot_longitude => data.spot.lng,
          # :message => data.message,
          # :created_at => data.created_at
        })
      end
    end
  end  
end
