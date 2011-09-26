require 'spec_helper'

describe "stratify-foursquare" do
  use_vcr_cassette "foursquare"

  it "collects and stores data from foursquare", :database => true do
    collector = Stratify::Foursquare::Collector.create!(:user_id => '108914') # TODO anonymize
    collector.run

    Stratify::Foursquare::Activity.where(
      :checkin_id => "4e80a308b8f7d6b24bd633b0",
      :venue_id => "4ad60a6ff964a520b50421e3",
      :venue_name => "Panera Bread",
      :venue_street => "7840 Alexander Promenade Pl. #100",
      :venue_city => "Raleigh",
      :venue_state => "NC",
      :venue_country => "USA",
      :venue_latitude => "35.91389010800875",
      :venue_longitude => "-78.77965182065964",
      # :created_at => Time.parse("2011-01-22T17:47:33Z")
    ).should exist

    # TODO Add assertion for very simple checkin
    # Stratify::Foursquare::Activity.where(
    #   :checkin_id => 26999668,
    #   :spot_name => "Starbucks",
    #   :created_at => Time.parse("2011-01-20T21:35:25Z")
    # ).should exist
  end
end
