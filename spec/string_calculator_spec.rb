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

    # some special cases
    context 'when consecutive delimiters present in the string' do
      it 'returns the correct sum' do
        expect(calculator.add("//;\n1;;;2")).to eq(3)
        expect(calculator.add("1,,2,3")).to eq(6)
      end
    end

    context 'when random spaces present in the string' do
      it 'returns the correct sum' do
        expect(calculator.add("//;\n  1 ;2")).to eq(3)
        expect(calculator.add("1,2,  3")).to eq(6)
      end
    end

    context 'when non numeric characters present in the string' do
      it 'returns the correct sum' do
        expect(calculator.add("//;\n1;a;2;z")).to eq(3)
        expect(calculator.add("1,d,2,b,3")).to eq(6)
      end
    end

    context 'when delimiter present in the end of the string' do
      it 'returns the correct sum' do
        expect(calculator.add("//;\n1;2;")).to eq(3)
        expect(calculator.add("1,2,3,")).to eq(6)
      end
    end

    # # TODO: validations
    # context 'when string is Invalid' do
    #   it 'raises an exception when string has multiple types of delimiters' do
    #     expect { calculator.add("1,2;3") }.to raise_error("Invalid format")
    #     expect { calculator.add("1,2;3|4") }.to raise_error("Invalid format")
    #   end
    #
    #   it 'raises an exception when string with custom delimiter has incorrect format' do
    #     expect { calculator.add("//;\n1,2;3") }.to raise_error("Invalid format")
    #     expect { calculator.add("//.\n1,2.3.4") }.to raise_error("Invalid format")
    #   end
    # end

    context 'with custom delimiter as *' do
      it 'returns the product of the string numbers' do
        expect(calculator.add("//*\n1*3*3")).to eq(9)
        expect(calculator.add("//*\n0*3*3")).to eq(0)
      end
    end
  end
end
