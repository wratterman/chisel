require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel'

class ChiselTest < Minitest::Test

  def test_it_exists
    a = Chisel.new

    assert_instance_of Chisel, a
  end

end
