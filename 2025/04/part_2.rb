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

total_removed = 0

loop do
  removed_this_round = lines.each_with_index.sum { |line, line_index|
    next 0 if line_index == 0 || line_index == lines.length - 1

    line.chars.each_with_index.sum { |char, index|
      next 0 unless char == "@"

      if neighbors.count { |row, col| lines[line_index + row][index + col] == "@" } < 4
        lines[line_index][index] = "."
        1
      else
        0
      end
    }
  }

  break if removed_this_round == 0

  total_removed += removed_this_round
end

puts total_removed
