# StringCalculator.rb class

class StringCalculator

  # Adds a list of numbers provided in a string format.
  # parameter[string]: number string containing numbers separated by commas, newline or custom delimiter.
  # return[Integer]: The sum of the numbers in the input string.
  def add(string)
    return 0 if string.empty?

    string.split(',').map(&:to_i).sum
  end
end
