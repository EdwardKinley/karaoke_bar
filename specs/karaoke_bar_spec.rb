require("minitest/autorun")
require_relative("../karaoke_bar.rb")
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")

class KaraokeBarTest < MiniTest::Test

  def setup
    @room1 = Room.new("Room 1", 10, 10)
    @room2 = Room.new("Room 2", 8, 12)
    @room3 = Room.new("Room 3", 2, 10)
    rooms = [@room1, @room2, @room3]
    @karaoke_bar1 = KaraokeBar.new("CodeClan Caraoke", rooms)
    @song1 = Song.new("A Simple Desultory Philippic", "Simon & Garfunkel")
    @song2 = Song.new("Bridge over Troubled Water", "Simon & Garfunkel")
    @guest1 = Guest.new("Paul", 100, @song1)
    @guest2 = Guest.new("Art", 10, @song2)
    @guest3 = Guest.new("Roy", 20, @song1)
    @guest4 = Guest.new("Al", 5, @song2)
  end

  def test_setup
    assert_equal("CodeClan Caraoke", @karaoke_bar1.name)
    assert_equal(3, @karaoke_bar1.rooms.count)
    assert_equal([@room1, @room2, @room3], @karaoke_bar1.rooms)
    assert_equal(@room1, @karaoke_bar1.rooms[0])
    assert_equal("Room 1", @karaoke_bar1.rooms[0].name)
    assert_equal(8, @karaoke_bar1.rooms[1].capacity)
  end

  def test_check_guest_in_to_room__okay
    @karaoke_bar1.check_guest_in_to_room(@room1, @guest1)
    assert(@karaoke_bar1.rooms[0].guests.include?(@guest1))
    assert_equal("Paul", @karaoke_bar1.rooms[0].guests[0].name)
  end

  def test_check_guest_in_to_room__too_full
    @karaoke_bar1.check_guest_in_to_room(@room3, @guest1)
    @karaoke_bar1.check_guest_in_to_room(@room3, @guest1)
    @karaoke_bar1.check_guest_in_to_room(@room3, @guest1)
    assert(@karaoke_bar1.rooms[2].guests.include?(@guest1))
    assert(!@karaoke_bar1.rooms[2].guests.include?(@guest3))
    assert_equal(2, @karaoke_bar1.rooms[2].guests.count)
    assert_equal("Paul", @karaoke_bar1.rooms[2].guests[0].name)
  end

  def test_check_guest_in_to_room__too_broke
    @karaoke_bar1.check_guest_in_to_room(@room1, @guest4)
    assert(!@karaoke_bar1.rooms[0].guests.include?(@guest4))
    assert_equal(0, @karaoke_bar1.rooms[0].guests.count)
  end

  def test_check_guest_out_of_room
    @karaoke_bar1.check_guest_in_to_room(@room1, @guest1)
    @karaoke_bar1.check_guest_in_to_room(@room1, @guest2)
    @karaoke_bar1.check_guest_out_of_room(@room1, @guest1)
    assert(!@karaoke_bar1.rooms[0].guests.include?(@guest1))
    assert(@karaoke_bar1.rooms[0].guests.include?(@guest2))
    assert_equal("Art", @karaoke_bar1.rooms[0].guests[0].name)
  end

  def test_add_song_to_room
    @karaoke_bar1.add_song_to_room(@room1, @song1)
    assert(@karaoke_bar1.rooms[0].songs.include?(@song1))
  end

  def test_guest_can_fit_in_room__yes
    @karaoke_bar1.check_guest_in_to_room(@room1, @guest1)
    assert(@karaoke_bar1.guest_can_fit_in_room?(@room1, @guest2))
  end

  def test_guest_can_fit_in_room__no
    @karaoke_bar1.check_guest_in_to_room(@room3, @guest1)
    @karaoke_bar1.check_guest_in_to_room(@room3, @guest2)
    assert(!@karaoke_bar1.guest_can_fit_in_room?(@room3, @guest3))
    @karaoke_bar1.check_guest_in_to_room(@room3, @guest3)
    assert_equal(2, @karaoke_bar1.rooms[2].guests.count)
  end


end
