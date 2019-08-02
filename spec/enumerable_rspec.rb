# frozen_string_literal: true

require_relative '../enumerable_methods.rb'

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

  describe '#my_all?' do
    even_array = [2, 4]
    it 'Returns true if the block never returns false or nil.' do
      expect(even_array.my_all?(&:even?)).to be true
    end

    it 'Returns true if the array is empty.' do
      expect([].my_all?(&:even?)).to be true
    end

    it 'Returns false when expression does not match all the elements' do
      expect(even_array.my_all?(&:odd?)).to be false
    end
  end

  describe '#my_inject' do
    numbers = [1, 2, 3, 4, 5]
    chars = %w[a b c d e]
    it 'Returns the sum of all number in the array' do
      expect(numbers.my_inject { |sum, n| sum + n }).to eq(15)
    end

    it 'Returns the sum of all numbers given a starting value' do
      expect(numbers.my_inject(10) { |sum, n| sum + n }).to eq(25)
    end

    it 'Returns the sum of all numbers given a starting value' do
      expect(chars.my_inject('') { |string, c| string + c }).to eq('abcde')
    end
  end

  describe '#my_map' do
    chars = %w[1 2 3 4 5]
    letters = %w[a b c]
    numbers = [1, 2, 3, 4, 5]
    it 'Checks if string is converted to intagers' do
      expect(chars.my_map{|str| str.to_i}).to eq(numbers)
    end

    it 'Checks if all the numbers are doubled' do 
      expect(numbers.my_map{|n| n*2}).to eq([2,4,6,8,10])
    end

    it 'Checks if all letters are upcase' do
      expect(letters.my_map{|string| string.upcase}).to eq(["A","B","C"])
    end
  end

end
