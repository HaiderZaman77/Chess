require_relative "./../util/util"

class Cell
  def initialize(piece, color, point)
    @piece = piece
    @position = Point.new(point.x, point.y)
    @color = color
  end

  attr_accessor :piece, :color, :position
end
