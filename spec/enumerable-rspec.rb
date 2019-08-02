# frozen_string_literal: true

require_relative '../enumerable-methods.rb'

RSpec.describe Enumerable do
  describe '#my_each' do
    array = [1, 2, 3, 4]
    str_to_array = %w[I had a good day]
    str = 'I had a good day'
    result = []
    it 'Should return changed array' do
      expect(array.my_each { |i| result << i**2 }).to eq(array)
    end

    it 'Checking iterating each element in array' do
      expect(result).to eq([1, 4, 9, 16])
    end
    it 'Converting string to array' do
      expect(str.split.my_each { |word| result << word }).to eq(str_to_array)
    end
  end

  describe '#my_select' do
    numbers = [1, 2, 3, 4, 5]
    odd_numbers = [1, 3, 5]

    it 'Should return an Array' do
      expect(numbers.my_select(&:even?)).to be_an(Array)
    end

    it 'Should select elements from the array and return a new array' do
      expect(numbers.my_select(&:odd?)).to eq(odd_numbers)
    end

    it 'Should return an empty array if no elements match' do
      expect(numbers.my_select { |e| e == 'x' }).to eq([])
    end
  end
end
