require_relative "./piece"
require_relative "./../util/util"
require_relative "./../util/point"
class Rook < Piece
  def initialize(color, position)
    super("Rook", color, position)
  end

  def getAvailableMoves(board)
    canMoveTo = []

    # check moves along y-axis
    (self.position.y + 1).upto(7) do |i|
      if !board[self.position.x][i].piece
        canMoveTo.push(getCellIdentifier(Point.new(self.position.x, i)))
      else
        break
      end
    end

    (self.position.y - 1).downto(0) do |i|
      if !board[self.position.x][i].piece
        canMoveTo.push(getCellIdentifier(Point.new(self.position.x, i)))
      else
        break
      end
    end


    # check moves along x-axis
    (self.position.x + 1).upto(7) do |i|
      if !board[i][self.position.y].piece
        canMoveTo.push(getCellIdentifier(Point.new(i, self.position.y)))
      else
        break
      end
    end

    (self.position.x - 1).downto(0) do
      |i|
      if !board[i][self.position.y].piece
        canMoveTo.push(getCellIdentifier(Point.new(i, self.position.y)))
      else
        break
      end
    end

    return canMoveTo
  end

end
