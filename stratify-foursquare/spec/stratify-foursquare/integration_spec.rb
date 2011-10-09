require 'spec_helper'

# TODO Patch Stratify base to include this change.  Add a spec for it.
module Stratify
  class << self
    def logger
      @logger ||= initialize_logger
    end

    private
    
    def initialize_logger
      return Rails.logger if (defined?(Rails) && Rails.logger)
      Logger.new(STDOUT)
    end    
  end
end


describe "stratify-foursquare" do
  use_vcr_cassette "foursquare"

  it "collects and stores data from foursquare", :database => true do
    collector = Stratify::Foursquare::Collector.create!(:oauth_token => 'NEFB1MA3VGSHFEGJ4YW0JESYWRXMREUEMZCRGGYO34XECCGK') # TODO anonymize
    collector.run

    Stratify::Foursquare::Activity.where(
      :checkin_id => "4e85118c6c25709c5f998be5",
      :venue_id => "4ba41d75f964a520108338e3",
      :venue_name => "Cochon",
      :venue_street => "930 Tchoupitoulas St",
      :venue_city => "New Orleans",
      :venue_state => "LA",
      :venue_country => "USA",
      :venue_postal_code => "70130",
      :venue_latitude => 29.942296295356602,
      :venue_longitude => -90.06738245487213,
      :created_at => Time.parse("Thu, 29 Sep 2011 19:47:08 CDT")
    ).should exist

    Stratify::Foursquare::Activity.where(
      :checkin_id => "4e85dfc002d58a685e9aade7",
      :venue_country => nil
    ).should exist
  end
end
