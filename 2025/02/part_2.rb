input = File.read("input.txt")

puts input.split(",").sum { |range_str|
  range_start, range_end = range_str.split("-").map(&:to_i)

  (range_start..range_end).sum { |num|
    num.to_s.match(/^(\d+)\1+$/) ? num : 0
  }
}
