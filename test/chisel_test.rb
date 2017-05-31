require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel'

class ChiselTest < Minitest::Test

  def test_it_exists
    a = Chisel.new

    assert_instance_of Chisel, a
  end

  def test_it_will_read_what_is_in_my_input_file
    a = Chisel.new
    expected = "# My Life in Desserts

## Chapter 1: The Beginning

\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in
**Food & Wine** this place has been packed every night.\"
"
    actual = a.read_markdown

    assert_equal expected, actual
  end

end
