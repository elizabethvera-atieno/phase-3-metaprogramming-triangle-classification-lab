require 'pry'

class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize side1, side2, side3
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @sides = [side1, side2, side3]
  end

  def kind
    array_size = @sides.uniq.size
    if(@sides.include? 0)
      raise TriangleError
    end

    if is_valid_triangle?
      if array_size == 1
        return :equilateral
      elsif array_size == 2
        return :isosceles
      elsif array_size == 3
        return :scalene
      elsif array_size == 0
        raise TriangleError
      end
    else
      raise TriangleError
    end
    
    
  end

  class TriangleError < StandardError

  end

  def is_valid_triangle?
    sorted_lenghts = [side1, side2, side3].sort
    longest = sorted_lenghts.pop
    longest < sorted_lenghts.sum
  end


end
