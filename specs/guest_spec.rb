require("minitest/autorun")
require_relative("../guest.rb")
require_relative("../song.rb")

class GuestTest < MiniTest::Test

  def setup
    @song1 = Song.new("A Simple Desultory Philippic", "Simon & Garfunkel")
    @song2 = Song.new("Bridge over Troubled Water", "Simon & Garfunkel")
    @guest1 = Guest.new("Paul", 100, @song1)
    @guest2 = Guest.new("Art", 10, @song2)
  end

  def test_guest_name
    assert_equal("Paul", @guest1.name)
    assert_equal("Art", @guest2.name)
    assert_equal(100, @guest1.funds)
    assert_equal(@song2, @guest2.fave_song)
    assert_equal("Bridge over Troubled Water", @guest2.fave_song.name)
  end

end
