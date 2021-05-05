require_relative "./cell"
require_relative "./../piece/bishop"
require_relative "./../piece/king"
require_relative "./../piece/knight"
require_relative "./../piece/pawn"
require_relative "./../piece/queen"
require_relative "./../piece/rook"

class Board
  def initialize
    @board = Array.new(8) {Array.new(8)}
    @whitePiecesList = Array.new(16)
    @blackPiecesList = Array.new(16)
  end

  def setBoard
    color = true
    for i in 0..7
      for j in 0..7
        @board[i][j] = Cell.new(0, color, Point.new(i, j))
        color = !color
      end
    end

    setWhitePiecesList
    setBlackPiecesList
    setWhitePieces
    setBlackPieces
  end

  def getBoard
    for i in 0..7
      for j in 0..7
        puts "Location #{i}-#{j}"
        puts "x-axis #{@board[i][j].position.x}"
        puts "y-axis #{@board[i][j].position.y}"
        puts "Color #{@board[i][j].color}"
      end
    end
  end

  def setBlackPiecesList
    for i in 0..7
      @blackPiecesList[i] = Pawn.new("black",Point.new(i,1))
    end
    @blackPiecesList[8] = Rook.new("black",Point.new(0,0))
    @blackPiecesList[9] = Knight.new("black",Point.new(1,0))
    @blackPiecesList[10] = Bishop.new("black",Point.new(2,0))
    @blackPiecesList[11] = Queen.new("black",Point.new(3,0))
    @blackPiecesList[12] = King.new("black",Point.new(4,0))
    @blackPiecesList[13] = Bishop.new("black",Point.new(5,0))
    @blackPiecesList[14] = Knight.new("black",Point.new(6,0))
    @blackPiecesList[15] = Rook.new("black",Point.new(7,0))
  end


  def setWhitePiecesList
    for i in 0..7
      @whitePiecesList[i] = Pawn.new("white",Point.new(i,6))
    end
    @whitePiecesList[8] = Rook.new("white",Point.new(0,7))
    @whitePiecesList[9] = Knight.new("white",Point.new(1,7))
    @whitePiecesList[10] = Bishop.new("white",Point.new(2,7))
    @whitePiecesList[11] = Queen.new("white",Point.new(3,7))
    @whitePiecesList[12] = King.new("white",Point.new(4,7))
    @whitePiecesList[13] = Bishop.new("white",Point.new(5,7))
    @whitePiecesList[14] = Knight.new("white",Point.new(6,7))
    @whitePiecesList[15] = Rook.new("white",Point.new(7,7))
  end

  def setWhitePieces
    @board[0][0].piece = @whitePiecesList[8]
    @board[0][1].piece = @whitePiecesList[9]
    @board[0][2].piece = @whitePiecesList[10]
    @board[0][3].piece = @whitePiecesList[11]
    @board[0][4].piece = @whitePiecesList[12]
    @board[0][5].piece = @whitePiecesList[13]
    @board[0][6].piece = @whitePiecesList[14]
    @board[0][7].piece = @whitePiecesList[15]

    for j in 0..7
      @board[1][j] = @whitePiecesList[j]
    end
  end

  def setBlackPieces
    @board[7][0].piece = @blackPiecesList[8]
    @board[7][1].piece = @blackPiecesList[9]
    @board[7][2].piece = @blackPiecesList[10]
    @board[7][3].piece = @blackPiecesList[11]
    @board[7][4].piece = @blackPiecesList[12]
    @board[7][5].piece = @blackPiecesList[13]
    @board[7][6].piece = @blackPiecesList[14]
    @board[7][7].piece = @blackPiecesList[15]
    for j in 0..7
      @board[6][j] = @blackPiecesList[j]
    end
  end

  def getNotCapturedPieces
    piecesList = []

    for i in 0..15
      if(!@whitePiecesList[i].isCaptured)
        piecesList.push(@whitePiecesList[i])
      end
    end

    for i in 0..15
      if(!@blackPiecesList[i].isCaptured)
        piecesList.push(@blackPiecesList[i])
      end
    end

    return piecesList
  end

  def getCapturedPieces
    caputeredPiecesList = []
    count = 0

    for i in 0..15
      if(@whitePiecesList[i].isCaptured)
        capturedPiecesList.push(@whitePiecesList[i])
        count = count + 1
      else
        next
      end
    end

    for i in 0..15
      if(@blackPiecesList[i].isCaptured)
        capturedPiecesList.push(@blackPiecesList[i])
        count = count +1
        else
          next
      end
    end

    return count

  end

  attr_accessor :board
end
