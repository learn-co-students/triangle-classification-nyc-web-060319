require "pry"

class Triangle
  # write code here
  attr_accessor :equilateral, :isosceles, :scalene
  attr_reader :a, :b, :c 

  def initialize(a,b,c)
    @a = a 
    @b = b 
    @c = c
  end

  def kind 
    if a == b && b == c  
      :equilateral 
    elsif a == b || a == c || b == c  
      :isosceles 
    else 
      :scalene 
    end
  end

  def validate
    valid_triangle = [(a+b>c), (a+c>b), (b+c>a)]

    [a,b,c].each do |side|
      if side <= 0 
      valid_triangle << false
      end
    end

    if valid_triangle.include?(false)
      begin
        raise TriangleError
      rescue TriangleError => error 
        puts error.message
      end
    else
      self.kind
    end

  end

  class TriangleError < StandardError
    def message
      "Wrong argument!"
    end
  end

end

my_triangle = Triangle.new(-3,-1,1)
puts my_triangle.kind

binding.pry


# def validate_triangle
#   real_triangle = [(a + b > c), (a + c > b), (b + c > a)]
#   [a, b, c].each { |s| real_triangle << false if s <= 0 }
#   raise TriangleError if real_triangle.include?(false)
# end