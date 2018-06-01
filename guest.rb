class Guest

  attr_reader(:name, :funds, :fave_song)

  attr_writer(:funds)

  def initialize(name, funds, fave_song)
    @name = name
    @funds = funds
    @fave_song = fave_song
  end

end
