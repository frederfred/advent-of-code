lines = File.read("input.txt").lines

puts lines.sum { |line|
  digits = line.scan(/(\d)/).flatten
  digits.combination(2).map { |a, b| (a + b).to_i }.max
}
