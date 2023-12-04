data = File.read("input.txt")
lines = data.lines

symbols = data.gsub(/\.+|\d+|\n/, "").chars.uniq
symbols_regexp = Regexp.new(symbols.map { Regexp.escape(_1) }.join("|"))

# Avoid having to check for out-of-bounds.
lines.map! { ".#{_1}." }
lines.unshift "." * lines.first.length
lines.push "." * lines.first.length

puts lines.each_with_index.sum { |line, line_index|
  line.gsub(/(\d+)/).sum { |num|
    num_index = Regexp.last_match.begin(0)

    symbol_before = line.slice(num_index - 1).match(symbols_regexp)
    symbol_after = line.slice(num_index + num.length).match(symbols_regexp)

    symbol_on_previous_line = lines[line_index - 1].slice(num_index - 1, num.length + 2).match(symbols_regexp)
    symbol_on_next_line = lines[line_index + 1].slice(num_index - 1, num.length + 2).match(symbols_regexp)

    if symbol_before || symbol_after || symbol_on_previous_line || symbol_on_next_line
      num.to_i
    else
      0
    end
  }
}
