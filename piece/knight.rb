require_relative "./piece"

class Knight < Piece
  def initialize(color, position)
    super("Knight", color, position)
  end

  def getAvailableMoves(board)
    canMoveTo = []

    # |___________

    x = self.position.x + 2
    y = self.position.y + 1

    if (x <=7 && y <= 7)
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
      end
    end

      # __________|

    x = self.position.x - 2
    y = self.position.y + 1

    if(x >=0  && y <= 7)
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
      end
    end

      # --------|

    x = self.position.x - 2
    y = self.position.y - 1

    if (x >=0 && y >= 0)
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
      end
    end

      #|-----------

    x = self.position.x + 2
    y = self.position.y - 1

    if (x <= 7 && y >= 0)
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
      end
    end

      # _
      #  |
      #  |

    x = self.position.x + 1
    y = self.position.y + 2

    if (x <= 7 && y <= 7)
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
      end
    end

        #  -
        # |
        # |

    x = self.position.x - 1
    y = self.position.y + 2

    if (x >= 0 && y <= 7)
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
      end
    end

        # |
        # |
        #  --

    x = self.position.x - 1
    y = self.position.y - 2

    if (x >= 0 && y >= 0)
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
      end
    end

              #  |
              #  |
              #--

    x = self.position.x + 1
    y = self.position.y - 2

    if (x <= 7 && y >= 0)
      if !board[x][y].piece
        canMoveTo.push(getCellIdentifier(Point.new(x, y)))
      end
    end

    return canMoveTo
  end


end

