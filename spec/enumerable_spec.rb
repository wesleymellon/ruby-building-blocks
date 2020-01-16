require "./enumerable_methods.rb"

RSpec.describe Enumerable do
  describe "#my_select" do
    it "returns a filtered list of only even numbers" do
      expect([1,2,3].my_select {|n| n.even?}).to eql([2])
    end
    it "returns an empty array when an empty array is given" do
      expect([].my_select {|n| n.even?}).to eql([])
    end
    it "returns words without the letter 'a'" do
      expect(["apple", "carrot", "kiwi", "banana", "celery"].my_select do |word|
        word.include?("a")
      end).to eql(["apple", "carrot", "banana"])
    end
  end
end