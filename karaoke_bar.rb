class KaraokeBar

  attr_reader(:name, :rooms)

  def initialize(name, rooms)
    @name = name
    @rooms = rooms
  end

  def check_guest_in_to_room(room, guest)
    room.check_guest_in(guest)
  end

  def check_guest_out_of_room(room, guest)
    room.check_guest_out(guest)
  end

  def add_song_to_room(room, song)
    room.add_song(song)
  end

end
