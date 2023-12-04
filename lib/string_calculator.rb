class StringCalculator
  
  def self.add(input)
    if input.empty?
      0
    else
      numbers = input.split(",").map { |number| number.to_i }
      input.to_i
    end
  end
  
end