class Chisel

  def read_markdown
    new_text = File.read('./my_input.markdown')
    new_text = new_text.split("\n")
    add_line_breaks(new_text)
  end

  def add_line_breaks(text)
    text.map! do |line|
      line_substitution(line)
    end
    text
  end

  def line_substitution(line)
    if line == ""
      line.sub("", "\n")
    else
      line = line
    end
  end

  def translate_header
    first_header = ((read_markdown[0].sub("# ", "<h1>") + "</h1>") + read_markdown[1]).chomp
  end

  def translate_second_header
    second_header = ((read_markdown[2].sub("## ", "<h2>") + "</h2>") + read_markdown[3]).chomp
  end

  def translate_paragraph
    paragraph = "<p>\n" + read_markdown[4] + " " + read_markdown[5] + "\n" + "</p>"
  end

  def translate_text
    translate_header + translate_second_header + translate_paragraph
  end
end

a = Chisel.new
puts a.read_markdown
