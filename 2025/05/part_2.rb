input = File.read("input.txt")

fresh_ingredients_part = input.split("\n\n").first
fresh_ingredients = fresh_ingredients_part.split("\n").map { _1.split("-").map(&:to_i) }

puts fresh_ingredients
  .sort_by(&:first)
  .each_with_object([]) { |(start, stop), result|
    if result.empty? || result.last[1] < start
      result << [start, stop]
    else
      result.last[1] = [result.last[1], stop].max
    end
  }.sum { |start, stop| stop - start + 1 } # +1 to include the stop value.
