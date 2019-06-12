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
      @equilateral 
    elsif a == b || a == c || b == c  
      :isosceles 
    else 
      :scalene 
    end
  end

  def validated? 
    
  end

  def TriangleError < StandardError

  end

end
