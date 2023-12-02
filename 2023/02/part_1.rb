lines = File.read("input.txt").lines

in_bag = {
  red: 12,
  green: 13,
  blue: 14,
}

puts lines.reduce(0) { |sum, line|
  id = line.scan(/([0-9]+):/).flatten.first.to_i

  in_bag.all? { |color, count|
    line.scan(/([0-9]+) #{color}/).flatten.map(&:to_i).max.to_i <= count
  } ? sum + id : sum
}
