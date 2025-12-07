input = File.read("input.txt")

tachyon_beam_indexes = [ input.lines.first.index("S") ]
splits = 0

input.lines.each do |line|
  line.chars.each_with_index do |char, index|
    next unless char == "^" && tachyon_beam_indexes.include?(index)

    splits += 1

    tachyon_beam_indexes << index - 1
    tachyon_beam_indexes << index + 1
    tachyon_beam_indexes.delete(index)
    tachyon_beam_indexes.uniq!
  end
end

puts splits
