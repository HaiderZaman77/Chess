require_relative "./piece"

class King < Piece
  def initialize(color, position)
    super("King", color, position)
  end

  def getAvailableMoves(board)
    canMoveTo = []

    x = self.position.x + 1
    y = self.position.y

    if x <= 7
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
      end
    end

    x = self.position.x - 1
    y = self.position.y

    if x >= 0
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
      end
    end

    x = self.position.x
    y = self.position.y + 1

    if y <= 7
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
      end
    end
    x = self.position.x
    y = self.position.y - 1

    if y >= 7
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
      end
    end

    x = self.position.x - 1
    y = self.position.y + 1

    if(x >= 0 && y <= 7)
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
      end
    end

    x = self.position.x + 1
    y = self.position.y + 1

    if(x <= 7 && y <= 7)
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
      end
    end

    x = self.position.x + 1
    y = self.position.y - 1

    if(x <= 7 && y >= 0)
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
      end
    end

    x = self.position.x - 1
    y = self.position.y - 1

    if(x >= 0 && y >= 0)
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
      end
    end

    return canMoveTo

  end

end
