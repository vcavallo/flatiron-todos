class Triangle

  def initialize(side1,side2,side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @all_sides = [@side1,@side2,@side3] 
  end

  def is_negative?(number)
    value = number <=> 0 
    true if value <= 0
  end

  def array_includes_negative?
    values = @all_sides.collect {|side| is_negative?(side)}
    values.compact.include?(true)
  end

  def violates_inequality?
    ((@side1 + @side2) <= @side3) || 
    ((@side1 + @side3) <= @side2) || 
    ((@side2 + @side3) <= @side1)
  end

  def kind
    result = :scalene
    if violates_inequality?
      raise TriangleError
    elsif @all_sides.include?(0)
      raise TriangleError
    elsif array_includes_negative?
      raise TriangleError
    elsif @all_sides.uniq.size == 2
      result = :isosceles
    elsif @all_sides.uniq.size == 1
      result = :equilateral
    end
    result
  end


end

class TriangleError < StandardError
end