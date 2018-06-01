require("minitest/autorun")
require_relative("../song.rb")

class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("A Simple Desultory Philippic", "Simon & Garfunkel")
    @song2 = Song.new("Bridge over Troubled Water", "Simon & Garfunkel")
  end

  def test_setup
    assert_equal("A Simple Desultory Philippic", @song1.name)
    assert_equal("Simon & Garfunkel", @song2.artist)
  end

end
