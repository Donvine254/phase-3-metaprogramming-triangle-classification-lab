require "pry"
class Triangle
  attr_accessor :base, :right, :left

  def initialize(base, right, left)
    @base = base
    @right = right
    @left = left
  end

  def kind
    invalid_error

    triangle_kind = case
    when @base == @left && @left == @right then :equilateral
    when @base == @left || @right == @left || @base == @right then :isosceles
    when @base != @right && @left != @right && @base != @left then :scalene
    end
  end

  def invalid_error
    if @base <= 0 || @right <= 0 || @left <= 0
      raise TriangleError
    elsif @base + @right <= @left || @base + @left <= @right || @left + @right <= @base
      raise TriangleError
    end
  end

  class TriangleError < StandardError
    def message
      "Please specify valid triangle side lengths."
    end
  end
end
