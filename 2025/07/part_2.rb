input = File.read("input.txt")

timelines = [0] * input.lines.first.length
timelines[input.lines.first.index("S")] = 1

input.lines.each do |line|
  line.chars.each_with_index do |char, index|
    next unless char == "^"

    timelines[index - 1] = timelines[index - 1] + timelines[index]
    timelines[index + 1] = timelines[index + 1] + timelines[index]
    timelines[index] = 0
  end
end

puts timelines.sum
