class Chisel

  def read_markdown
    new_text = File.read('./my_input.markdown')
    new_text = new_text.split("\n")
    new_text.delete("")
    p new_text
  end

  def translate_header
    first_header = read_markdown[0].sub("# ", "<h1>") + "</h1>"
  end

  def translate_second_header
    second_header = read_markdown[1].sub("## ", "<h2>") + "</h2>"
  end

end
