require_relative "./piece"


class Pawn < Piece
  def initialize(color, position)
    super("Pawn", color, position)
    @firstMove = true
  end

  def getAvailableMoves(board)
    canMoveTo = []

    if self.color == "White"
      if !board[self.position.x][self.position.y + 1].piece
        canMoveTo.push(getCellIdentifier(Point.new(self.position.x, self.position.y + 1)))
      end
      if @firstMove && !board[self.position.x][self.position.y + 2].piece
        canMoveTo.push(getCellIdentifier(Point.new(self.position.x, self.position.y + 2)))
      end
    else
      if !board[self.position.x][self.position.y - 1].piece
        canMoveTo.push(getCellIdentifier(Point.new(self.position.x, self.position.y - 1)))
      end
      if @firstMove && !board[self.position.x][self.position.y - 2].piece
        canMoveTo.push(getCellIdentifier(Point.new(self.position.x, self.position.y - 2)))
      end
    end

    return canMoveTo
  end

  def move(board, finalPosition)
    board[finalPosition.x][finalPosition.y].piece = self
    board[self.position.x][self.position.y].piece = nil
    self.position.x = finalPosition.x
    self.position.y = finalPosition.y
  end
end
