require 'park'
require 'test/unit'

class ParkTest < Test::Unit::TestCase
  def setup
    @name = "park"
  end

  def test_first_name
    assert_equal @name, "park"
  end
end
