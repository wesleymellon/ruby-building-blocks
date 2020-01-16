require "./enumerable_methods.rb"

RSpec.describe Enumerable do
  describe "#my_select" do
    it "returns a filtered list of only even numbers" do
      expect([1,2,3].select {|n| n.even?}).to eql([2])
      # expect(Enumerable.my_select([1,2,3,4,5,6])).to eql([2,4,6])
    end
  end
end