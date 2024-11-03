# StringCalculator

A simple Ruby-based `StringCalculator` class that adds numbers from a string input. This calculator supports comma-separated values, newlines as delimiters, custom delimiters, and handles errors for negative numbers.

## Features

- **Basic Addition**: Adds numbers provided in a comma-separated string.
- **Newline Support**: Handles newlines between numbers, e.g., `"1\n2,3"`.
- **Custom Delimiters**: Allows custom delimiters specified in the format `"//[delimiter]\n[numbers…]"`.
  - Example: `"//;\n1;2"` returns `3`.
- **Error Handling**: Throws an error if negative numbers are present in the input, listing all negative values.

## Setup

1. Clone this repository:
   ```
   git clone https://github.com/AnkitaTandel/string_calculator_ruby.git
   cd string_calculator_ruby
   ```

2. Ensure you have Ruby installed (version 2.7 or higher is recommended).
3. Install rspec for testing:

  ```
  gem install rspec
  ```

## Usage

#### Example
You can use the `StringCalculator` class as follows:

  ```
    require_relative 'string_calculator'

    calculator = StringCalculator.new
    puts calculator.add("1,2,3")          # Output: 6
    puts calculator.add("1\n2,3")         # Output: 6
    puts calculator.add("//;\n1;2")       # Output: 3

    # Negative numbers raise an exception
    begin
      puts calculator.add("1,-2,3")
    rescue => e
      puts e.message                      # Output: negative numbers not allowed: -2
    end

  ```

## How It Works

- **Extract Custom Delimiters**: The method first checks if a custom delimiter is specified at the beginning of the string in the format `"//[delimiter]\n[numbers…]"`. If found, it extracts this delimiter for splitting numbers.
- **Split Numbers**: The numbers are split based on the delimiter (default: comma or newline).
- **Negative Numbers Check**: Before summing, it checks for any negative numbers and raises an error if found.
- **Sum Calculation**: Converts the numbers to integers and returns their sum.


## Testing
RSpec tests are provided for different scenarios and edge cases.

Run the tests by navigating to the project directory and executing:
```
rspec spec/string_calculator_spec.rb

```
