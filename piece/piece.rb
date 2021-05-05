require_relative "./../util/point"

class Piece
  def initialize(name, color, position)
    @name = name
    @color = color
    @position = Point.new(position.x, position.y)
    @isCaptured = false
  end

  attr_accessor :name, :color, :position, :isCaptured
end
