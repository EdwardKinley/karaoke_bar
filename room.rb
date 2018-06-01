class Room

  attr_reader(:name, :capacity, :fee, :guests, :songs)

  def initialize(name, capacity, fee, guests = [], songs = [])
    @name = name
    @capacity = capacity
    @fee = fee
    @guests = guests
    @songs = songs
  end

  def check_guest_in(guest)
    return if @guests.count >= @capacity
    return if guest.funds < @fee
    @guests.push(guest)
    guest.funds -= @fee
  end

  def check_guest_out(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs.push(song)
  end

end
