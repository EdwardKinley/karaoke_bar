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

  def guest_can_fit_in_room?(room, guest)
    return room.guests.count < room.capacity
  end

  def fire_alarm #everyone out!
    @rooms.each{|room| room.guests = []}
  end

  def add_song_to_every_room(song)
    @rooms.each{|room| room.add_song(song)}
  end

  def make_room_fees_half_price
    @rooms.each{|room| room.fee /= 2.0}
  end

  def adjust_room_fees(multiple)
    @rooms.each{|room| room.fee *= multiple}
  end

end
