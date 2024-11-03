# spec/string_calculator_spec.rb

require_relative '../string_calculator'
require 'rspec'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(calculator.add('')).to eq 0
    end

    it 'returns the number itself when a single number is provided' do
      expect(calculator.add('1')).to eq(1)
      expect(calculator.add('15')).to eq(15)
    end

    it 'returns the sum of two comma-saperated numbers' do
      expect(calculator.add('1,2')).to eq(3)
    end
  end
end
