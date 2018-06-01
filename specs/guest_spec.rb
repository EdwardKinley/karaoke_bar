require("minitest/autorun")
require_relative("../guest.rb")

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Paul", 100)
    @guest2 = Guest.new("Art", 10)
  end

  def test_guest_name
    assert_equal("Paul", @guest1.name)
    assert_equal("Art", @guest2.name)
    assert_equal(100, @guest1.funds)
  end

end
