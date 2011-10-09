require 'stratify-foursquare/presenter'

module Stratify
  module Foursquare
    class Activity < Stratify::Activity
      field :checkin_id, :type => String
      field :venue_id, :type => String
      field :venue_name, :type => String
      field :venue_street, :type => String
      field :venue_city, :type => String
      field :venue_state, :type => String
      field :venue_postal_code, :type => String
      field :venue_country, :type => String
      field :venue_latitude, :type => BigDecimal
      field :venue_longitude, :type => BigDecimal

      natural_key :checkin_id

      validates_presence_of :venue_id, :venue_name

      # template %q[
      #   <p class="summary"><%= summary %></p>
      #   <p class="details"><%= details %></p>
      # ]
      # 
      # def permalink
      #   "http://connect.garmin.com/activity/#{guid}"
      # end
      # 
      # def presenter
      #   Stratify::Foursquare::Presenter.new(self)
      # end
    end
  end
end
