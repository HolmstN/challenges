class SumOfMultiples
  def initialize(*divisors)
    @divisors = divisors
    @multiples = []
  end

  def to(limit)
    each_divisible(@divisors, limit) { |divisor| @multiples << divisor }
    @multiples.uniq.inject(:+) || 0
  end

  def self.to(num)
    new(3, 5).to(num)
  end

  private

  def each_divisible(array, limit)
    array.each do |element|
      counter = 0
      while counter < limit
        if counter % element == 0
          yield(counter)
        end
        counter += 1
      end
    end
  end
end
