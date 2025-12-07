input = File.read("input.txt")

lines = input.lines.map { _1.gsub("\n", "") }
cols = lines.map { _1.split("") }.transpose

groups = []
current_group = []
operator = lines.last[0]

cols.each do |col|
  if col.all? { _1 == " " }
    current_group << operator
    groups << current_group
    current_group = []
    next
  end

  if ["+", "*"].include?(col.last)
    operator = col.last
  end

  col_numbers = col.reject { _1 == " " }.take(col.size - 1).compact.join
  current_group << col_numbers
end

current_group << operator
groups << current_group

puts groups.sum { |arr|
  numbers = arr.take(arr.size - 1).map(&:to_i)
  operator = arr.last

  numbers.inject(operator)
}
