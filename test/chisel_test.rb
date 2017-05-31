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
    expected =  ["# My Life in Desserts", "
", "## Chapter 1: The Beginning", "
", "\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in", "**Food & Wine** this place has been packed every night.\""]
    actual = a.read_markdown

    assert_equal expected, actual
  end

  def test_it_will_add_html_h1_header_to_first_sentence
    a = Chisel.new
    expected = "<h1>My Life in Desserts</h1>"
    actual = a.translate_header

    assert_equal expected, actual
  end

  def test_it_will_add_html_h2_header_to_second_header
    a = Chisel.new
    expected = "<h2>Chapter 1: The Beginning</h2>"
    actual = a.translate_second_header

    assert_equal expected, actual
  end

  def test_it_will_work_together
    a = Chisel.new

    assert_equal "<h1>My Life in Desserts</h1>", a.translate_header
    assert_equal "<h2>Chapter 1: The Beginning</h2>", a.translate_second_header
  end

  def test_it_will_add_html_paragraph_notation
    a = Chisel.new
    expected = "<p>\n\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in **Food & Wine** this place has been packed every night.\"\n</p>"
    actual = a.translate_paragraph

    assert_equal expected, actual
  end
end
