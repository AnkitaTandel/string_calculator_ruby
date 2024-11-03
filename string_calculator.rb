# StringCalculator.rb class

class StringCalculator

  # Adds a list of numbers provided in a string format.
  # parameter[string]: number string containing numbers separated by commas, newline or custom delimiter.
  # return[Integer]: The sum of the numbers in the input string.
  # Custom delimiter: If the string starts with "//[delimiter]\n", the specified delimiter will be used
  #                   instead of commas or newlines.
  def add(numbers)
    return 0 if numbers.empty?

    numbers.split(/,|\n/).map(&:to_i).sum
    # Check for custom delimiter format "//[delimiter]\n[numbers]"
    if numbers.start_with?("//")
      # Extract the delimiter and the rest of the numbers
      delimiter, numbers = numbers[2..].split("\n")
      # Split numbers by the custom delimiter or newline character
      numbers.split(Regexp.new("[#{delimiter},\n]")).map(&:to_i).sum
    else
      # Split numbers by comma or newline if no custom delimiter is specified
      numbers.split(/,|\n/).map(&:to_i).sum
    end
  end
end
