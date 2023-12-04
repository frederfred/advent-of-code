data = File.read("input.txt")
lines = data.lines

digits_at = lines.map { |line|
  line.enum_for(:scan, /(\d+)/).map { { match: _1[0].to_i, index: Regexp.last_match.begin(0) } }
}

puts lines.each_with_index.sum { |line, line_index|
  line.gsub(/\*/).sum {
    star_index = Regexp.last_match.begin(0)

    digits_before = digits_at[line_index].filter { |digit|
      digit.fetch(:index) == star_index - digit.fetch(:match).digits.length
    }

    digits_after = digits_at[line_index].filter { |digit|
      digit.fetch(:index) == star_index + 1
    }

    digit_on_previous_line = digits_at[line_index - 1].filter { |digit|
      star_index.between?(digit.fetch(:index) - 1, digit.fetch(:index) + digit.fetch(:match).digits.length)
    }

    digit_on_next_line = digits_at[line_index + 1].filter { |digit|
      star_index.between?(digit.fetch(:index) - 1, digit.fetch(:index) + digit.fetch(:match).digits.length)
    }

    if (digits_before + digits_after + digit_on_previous_line + digit_on_next_line).length == 2
      (digits_before + digits_after + digit_on_previous_line + digit_on_next_line).map { _1.fetch(:match, 1)}.reduce(:*)
    else
      0
    end
  }
}
