require_relative "./piece"

class Bishop < Piece
  def initialize(color, position)
    super("Bishop", color, position)
  end

  def getAvailableMoves(board)
    canMoveTo = []

    x = self.position.x - 1
    y = self.position.y + 1

    while (x >=0 && y <= 7)
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
        x -= 1
        y += 1
      else
        break
      end
    end

    x = self.position.x + 1
    y = self.position.y + 1

    while (x <= 7 && y <= 7)
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
        x += 1
        y +=1
      else
        break
      end
    end

    x = self.position.x - 1
    y = self.position.y - 1

    while x >=0 && y >= 0 do
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
        x -= 1
        y -=1
      else
        break
      end
    end

    x = self.position.x + 1
    y = self.position.y - 1

    while x <= 7 && y >= 0 do
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
        x += 1
        y -=1
      else
        break
      end
    end

    return canMoveTo
  end
end

