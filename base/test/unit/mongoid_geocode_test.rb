require 'test_helper'

class MongoidGeocodeTest < ActiveSupport::TestCase

  def setup
    skip if ENV['SKIP'] =~ /mongo/
    Point.delete_all
  end

  test "reverse geocode via callback" do
    p = Point.create(:name => "Target Field", :coordinates => [-93.28, 44.98])
    assert_not_nil p.address
  end

  test "reverse geocode fetches correct country" do
    # this ensures coordinates are in correct order before search
    p = Point.create(:name => "Target Field", :coordinates => [-93.28, 44.98])
    p.reverse_geocode
    assert_equal "US", p.country
  end
end
