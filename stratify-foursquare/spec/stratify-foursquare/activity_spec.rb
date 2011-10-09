require 'spec_helper'

describe Stratify::Foursquare::Activity do
  describe "#permalink" do
    it "returns the URL for this checkin on Foursquare" do
      activity = Stratify::Foursquare::Activity.new(:user_id => "1234567", :checkin_id => "4e85118c6c25709c5f998be5")
      activity.permalink.should == "https://foursquare.com/user/1234567/checkin/4e85118c6c25709c5f998be5"
    end
  end
end
