lines = File.read("input.txt").lines

battery_count = 12

puts lines.sum { |line|
  line_length = line.strip.length
  result = ""
  start = 0

  battery_count.times do
    remaining_count = battery_count - result.length
    last_start = line_length - remaining_count

    window = line[start..last_start]
    max_digit = window.chars.max
    max_digit_index = window.index(max_digit)

    result << max_digit
    start += max_digit_index + 1
  end

  result.to_i
}
