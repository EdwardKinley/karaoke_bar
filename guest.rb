class Guest

  attr_reader(:name, :funds)

  attr_writer(:funds)

  def initialize(name, funds)
    @name = name
    @funds = funds
  end

end
