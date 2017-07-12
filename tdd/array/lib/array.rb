class Array
  def my_uniq
    results = []
    self.each { |el| results << el unless results.include?(el) }
    results
  end

  def two_sum
    pairs = []
    (0...self.length - 1).each do |i|
      (i+1..self.length - 1).each do |j|
        pairs << [i, j] if self[i] + self[j] == 0
      end
    end
    pairs
  end



end

def my_transpose(array)
  array.each_with_index.map do |_, i|
    array.map { |row|  row[i] }
  end
end

def profitable_days(prices)
  days = []
  profit = 0
  (0...prices.length - 1).each do |i|
    (i+1..prices.length - 1).each do |j|
      current_profit = prices[j] - prices[i]
      if current_profit > profit
        days = [i, j]
        profit = current_profit
      end
    end
  end
  days
end
