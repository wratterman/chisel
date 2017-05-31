class Chisel

  def translate_text
    read_markdown
    message = translate_header + (read_markdown[1] * 2)+translate_second_header + (read_markdown[3] * 2) + translate_paragraph
    write_html(message)
    puts "Converted my_input.markdown (6 lines) to my_output.html (8 lines)"
  end

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
    look_for_strong(paragraph)
  end

  def look_for_strong(paragraph)
    if paragraph.include?("**")
      paragraph = paragraph.gsub("**", "<strong>")
    else
      paragraph
    end
    look_for_emphasis(paragraph)
  end

  def look_for_emphasis(paragraph)
    if paragraph.include?("*")
      paragraph = paragraph.gsub("*", "<em>")
    else
      paragraph
    end
    paragraph
  end

  def write_html(message)
    new_message = File.open('./my_output.html', "w")
    new_message.write(message)
    new_message.close
  end

end

a = Chisel.new
puts a.translate_text
