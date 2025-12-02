lines = File.read("input.txt").lines

zeros = 0
position = 50

lines.each do |line|
  direction, distance = line.match(/(?<direction>[LR])(?<distance>\d+)/).captures
  step = direction == "R" ? 1 : -1

  distance.to_i.times do
    position = (position + step) % 100
    zeros += 1 if position == 0
  end
end

puts zeros
