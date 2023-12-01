lines = File.read("input.txt").lines

puts lines.reduce(0) { |sum, line|
  digits = line.scan(/(\d)/).flatten
  sum + (digits[0] + digits[-1]).to_i
}
