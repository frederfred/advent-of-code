input = File.read("input.txt")

lines = input.lines.take(input.lines.size - 1).map { _1.split(" ").map(&:to_i) }.transpose
operators = input.lines.last.split(" ")

puts lines.each_with_index.sum { |nums, index|
  nums.inject(operators[index])
}
