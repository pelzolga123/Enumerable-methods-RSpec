require_relative '../enumerable-methods.rb'

RSpec.describe Enumerable do 
    describe "#my_each" do
        array = [1, 2, 3, 4]
        str_to_array = ['I', 'had', 'a', 'good', 'day']
        str = 'I had a good day'
        result = []
        it "Should return changed array" do
        expect(array.my_each{|i| result << i**2 }).to eq(array)
        end

        it 'Checking iterating each element in array' do
            expect(result).to eq([1, 4, 9, 16])
        end
        it 'Converting string to array' do
            expect(str.split.my_each{|word| result << word}).to eq(str_to_array)
        end     
    
    end

end