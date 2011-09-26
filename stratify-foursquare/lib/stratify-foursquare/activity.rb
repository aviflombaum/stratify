require 'stratify-foursquare/presenter'

module Stratify
  module Foursquare
    class Activity < Stratify::Activity
      # field :guid, :type => Integer
      # field :title
      # field :description
      # field :username
      # field :activity_type
      # field :event_type
      # field :distance_in_miles, :type => Float
      # field :time_in_seconds, :type => Integer
      # field :starting_latitude, :type => BigDecimal
      # field :starting_longitude, :type => BigDecimal

      natural_key :checkin_id

      # validates_presence_of :guid, :title, :username, :activity_type, :event_type, :distance_in_miles, :time_in_seconds

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
