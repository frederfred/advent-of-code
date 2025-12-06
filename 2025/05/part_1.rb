input = File.read("input.txt")

fresh_ingredients_part, ingredients_part = input.split("\n\n")
fresh_ingredients = fresh_ingredients_part.split("\n").map { _1.split("-").map(&:to_i) }

puts ingredients_part.lines.select { |line|
  id = line.strip.to_i

  fresh_ingredients.any? { |range_start, range_end|
    id >= range_start && id <= range_end
  }
}.count
