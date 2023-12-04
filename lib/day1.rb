class Day1
  def self.first_digit(input)
    input[/\d/].to_i
  end
  def self.last_digit(input)
    input[/(?=\d)[^0-9]*\d(?!.*\d)/].to_i
  end
  def self.line_value(input)
    (first_digit(input)*10 + last_digit(input)).to_i
  end
end