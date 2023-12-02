lines = File.read("input.txt").lines

puts lines.reduce(0) { |sum, line|
  sum + %i{red green blue}.map { |color|
    line.scan(/([0-9]+) #{color}/).flatten.map(&:to_i).max.to_i
  }.reduce(:*)
}
