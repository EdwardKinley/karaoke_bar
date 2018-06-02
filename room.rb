class Room

  attr_reader(:name, :capacity, :fee, :funds, :guests, :songs)

  attr_writer(:fee, :funds, :guests)

  def initialize(name, capacity, fee, funds = 0, guests = [], songs = [])
    @name = name
    @capacity = capacity
    @fee = fee
    @funds = funds
    @guests = guests
    @songs = songs
  end

  def check_guest_in(guest)
    return if @guests.count >= @capacity
    return if guest.funds < @fee
    @guests.push(guest)
    guest.funds -= @fee
    @funds += @fee
    return "Whoo!" if @songs.include?(guest.fave_song)
  end

  def check_guest_out(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs.push(song)
  end

end
