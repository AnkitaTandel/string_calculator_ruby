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

    context 'with comma-saperated numbers' do
      it 'returns the correct sum of two numbers' do
        expect(calculator.add('1,2')).to eq(3)
      end

      it 'returns the correct sum of nultiple numbers' do
        expect(calculator.add('1,2,3')).to eq(6)
      end
    end

    it 'returns sum when newlines character is present between numbers' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    context 'with custom delimiters specified in the  `//[delimiter]\n[numbers]` format' do
      context 'when delimiter is `;`' do
        it 'returns the correct sum by splitting number string using `;`' do
          expect(calculator.add("//;\n1;2")).to eq(3)
        end
      end

      context 'when delimiter is `|`' do
        it 'returns the correct sum by splitting number string using `|`' do
          expect(calculator.add("//|\n1|2")).to eq(3)
        end
      end
    end

    it 'raises an exception when negative number is present in the string' do
      expect { calculator.add("-1,-2") }.to raise_error("negative numbers not allowed: -1, -2")
      expect { calculator.add("-3,\n-4") }.to raise_error("negative numbers not allowed: -3, -4")
      expect { calculator.add("//;\n-5;-6") }.to raise_error("negative numbers not allowed: -5, -6")
    end
  end
end
