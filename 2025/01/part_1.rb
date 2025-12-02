lines = File.read("input.txt").lines

zeros = 0
position = 50

lines.each do |line|
  direction, distance = line.match(/([LR])(\d+)/).captures
  distance = distance.to_i
  step = direction == "R" ? 1 : -1

  position = (position + (step * distance)) % 100

  zeros += 1 if position.zero?
end

puts zeros
