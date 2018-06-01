class Room

  attr_reader(:name, :capacity, :guests, :songs)

  def initialize(name, capacity, guests = [], songs = [])
    @name = name
    @capacity = capacity
    @guests = guests
    @songs = songs
  end

  def check_guest_in(guest)
    @guests.push(guest)
  end

  def check_guest_out(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs.push(song)
  end

end
