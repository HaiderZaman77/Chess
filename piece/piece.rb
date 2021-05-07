require_relative "./../util/point"
require_relative "./../util/util"

class Piece
  def initialize(name, color, position)
    @name = name
    @color = color
    @position = Point.new(position.x, position.y)
    @isCaptured = false
  end

  def move(board, finalPosition)
    board[finalPosition.x][finalPosition.y].piece = self
    board[self.position.x][self.position.y].piece = nil
    self.position.x = finalPosition.x
    self.position.y = finalPosition.y
  end

  attr_accessor :name, :color, :position, :isCaptured
end
