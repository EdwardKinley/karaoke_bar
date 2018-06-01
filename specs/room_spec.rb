require("minitest/autorun")
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new("Room 1", 10, 10)
    @room2 = Room.new("Room 2", 8, 12)
    @song1 = Song.new("A Simple Desultory Philippic", "Simon & Garfunkel")
    @song2 = Song.new("Bridge over Troubled Water", "Simon & Garfunkel")
    @guest1 = Guest.new("Paul", 100, @song1)
    @guest2 = Guest.new("Art", 10, @song2)
  end

  def test_setup
    assert_equal("Room 1", @room1.name)
    assert_equal(8, @room2.capacity)
    assert_equal(12, @room2.fee)
    assert_equal([], @room2.guests)
    assert_equal([], @room1.songs)
    assert_equal(@song1, @guest1.fave_song)
  end

  def test_check_guest_in
    @room1.check_guest_in(@guest1)
    assert_equal(1, @room1.guests.count)
    assert(@room1.guests.include?(@guest1))
    assert_equal(90, @guest1.funds)
  end

  def test_check_guest_out
    @room1.check_guest_in(@guest2)
    @room1.check_guest_out(@guest2)
    assert_equal(0, @room1.guests.count)
    assert(!@room1.guests.include?(@guest2))
  end

  def test_add_song
    @room1.add_song(@song1)
    assert_equal(1, @room1.songs.count)
    assert(@room1.songs.include?(@song1))
  end

end
