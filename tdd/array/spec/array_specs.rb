require 'array'
require 'rspec'

describe "#my_uniq" do
  it "returns unique values in array" do
    expect([1, 2, 1, 3, 3].my_uniq).to eq([1,2,3])
  end
end

describe "#two_sum" do
  it "returns pairs of positions where the elements at those positions sum to zero" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe "#my_transpose" do
  it "converts between the row-oriented and column-oriented representations" do
    rows = [[0, 1, 2], [3, 4, 5],[6, 7, 8]]
    result = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
    expect(my_transpose(rows)).to eq(result)
  end
end

describe "#profitable_days" do

  it "returns the most profitable pair" do
    prices = [33, 10, 54, 43, 12, 22, 50]
    expect(profitable_days(prices)).to eq([1, 2])

  end

  context "when multiple pairs exist" do
    it "returns earliest day" do
      prices = [33, 10, 5, 60, 60, 22, 50]
      expect(profitable_days(prices)).to eq([2,3])
    end
  end



end
