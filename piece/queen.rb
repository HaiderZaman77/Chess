require_relative "./piece"
require_relative "./../util/util"
require_relative "./../util/point"

class Queen < Piece
  def initialize(color, position)
    super("Queen", color, position)
  end


  def getAxisMoves(board)
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

  def getDiagnolMoves(board)
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

  def getAvailableMoves(board)
    return getAxisMoves(board) + getDiagnolMoves(board)
  end





end
