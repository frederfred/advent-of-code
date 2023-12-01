lines = File.read("input.txt").lines

numbers_to_digit = {
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" => "6",
  "seven" => "7",
  "eight" => "8",
  "nine" => "9",
}

puts lines.reduce(0) { |sum, line|
  digits = line.scan(/(?=(#{numbers_to_digit.keys.join("|")}|\d))/).flatten.map { numbers_to_digit.fetch(_1, _1) }
  sum + (digits[0] + digits[-1]).to_i
}
