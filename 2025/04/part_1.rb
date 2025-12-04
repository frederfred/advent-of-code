lines = File.read("input.txt").lines

# Avoid having to check for out-of-bounds.
lines.map! { ".#{_1}." }
lines.unshift "." * (lines.first.length + 2)
lines.push "." * (lines.first.length + 2)

neighbors = [
  [-1, -1], [-1, 0], [-1, 1],
  [ 0, -1],          [ 0, 1],
  [ 1, -1], [ 1, 0], [ 1, 1],
]

puts lines.each_with_index.sum { |line, line_index|
  next 0 if line_index == 0 || line_index == lines.length - 1

  line.chars.each_with_index.sum { |char, index|
    next 0 unless char == "@"

    neighbors.count { |row, col| lines[line_index + row][index + col] == "@" } < 4 ? 1 : 0
  }
}
