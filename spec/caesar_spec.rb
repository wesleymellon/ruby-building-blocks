require "./caesar_cipher.rb"

RSpec.describe "#swap_letter" do
  it "returns the letter swapped by a positive integer" do
    expect(swap_letter("a", 2)).to eql("c")
  end

  it "returns the letter swapped by a negative integer" do 
    expect(swap_letter("d", -2)).to eql("b")
  end
end

RSpec.describe "#caesar_cipher" do 
  it "returns the word swapped by a positive integer" do
    expect(caesar_cipher("hello", 1)).to eql("ifmmp")
  end

  it "returns the word swapped by a negative integer" do
    expect(caesar_cipher("chewy", -1)).to eql("bgdvx")
  end
end