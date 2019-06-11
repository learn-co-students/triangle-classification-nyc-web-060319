def validate_triangle(first, second, third)
  if [first,second,third].any?{|side| side <= 0}
    raise Triangle::TriangleError
  end
  if (first + second) <= third
    raise Triangle::TriangleError
  end
  if (second + third) <= first
    raise Triangle::TriangleError
  end
  if (first + third) <= second
    raise Triangle::TriangleError
  end
end

class Triangle
  class TriangleError < StandardError
    def message
      puts "bad triangle!"
    end
  end

  # write code here
  def initialize(first, second, third)
    validate_triangle(first, second, third)
    @first = first
    @second = second
    @third = third
  end

  def equilateral?
    if (@first == @second) && (@second == @third)
      return true
    end
    false
  end

  def isosceles?
    if equilateral?
      raise StandardError
    end
    if (@first == @second)
      return true
    end
    if (@first == @third)
      return true
    end
    if (@second == @third)
      return true
    end
    return false
  end

  def kind
    if equilateral?
      return :equilateral
    end
    if isosceles?
      return :isosceles
    end
    return :scalene
  end
end
