require("minitest/autorun")
require_relative("../room.rb")
require_relative("../guest.rb")

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new("Room 1", 10)
    @room2 = Room.new("Room 2", 8)
    @guest1 = Guest.new("Paul")
    @guest2 = Guest.new("Art")
  end

  def test_setup
    assert_equal("Room 1", @room1.name)
    assert_equal(8, @room2.capacity)
    assert_equal([], @room1.songs)
  end

  def test_check_guest_in
    @room1.check_guest_in(@guest1)
    assert_equal(1, @room1.guests.count)
    assert_equal(true, @room1.guests.include?(@guest1))
  end

  def test_check_guest_out
    @room1.check_guest_in(@guest2)
    @room1.check_guest_out(@guest2)
    assert_equal(0, @room1.guests.count)
    assert_equal(false, @room1.guests.include?(@guest2))
  end

end
