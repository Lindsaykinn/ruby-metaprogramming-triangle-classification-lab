# class Triangle

#   attr_accessor :side_1, :side_2, :side_3
  
#   def initialize(side_1, side_2, side_3)
#     @side_1 = side_1
#     @side_2 = side_2
#     @side_3 = side_3
#   end

#   def kind
#     if @side_1 == @side_2 && @side_2 == @side_3 && @side_3 == @side_1
#       :equilateral
#     elsif @side_2 == @side_3 || @side_1 == @side_2 || @side_1 == @side_3
#        :isosceles
#     else 
#       :scalene
#     end
#   end

#   class TriangleError < StandardError
#     def valid_triangle
#       valid = [(@side_1 + @side_2 > @side_3), (@side_1 + @side_3 > @side_2), (@side_2 + @side_3 > @side_1)]
#       [@side_1, @side_2, @side_3].each do |side|
#         valid << false if side <= 0
#         raise TriangleError if valid.include?(false)
#       end
#     end
#   end
# end

class Triangle
  attr_reader :side_1, :side_2, :side_3
  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def kind
    validate_triangle
    if side_1 == side_2 && side_2 == side_3
      :equilateral
    elsif side_1 == side_2 || side_2 == side_3 || side_1 == side_3
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    real_triangle = [(side_1 + side_2 > side_3), (side_1 + side_3 > side_2), (side_2 + side_3 > side_1)]
    [side_1, side_2, side_3].each do |side|
      real_triangle << false if side <= 0 
    raise TriangleError if real_triangle.include?(false)
    end
  end

  class TriangleError < StandardError
  end

end
