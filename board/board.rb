require_relative "./cell"
require_relative "./../piece/bishop"
require_relative "./../piece/king"
require_relative "./../piece/knight"
require_relative "./../piece/pawn"
require_relative "./../piece/queen"
require_relative "./../piece/rook"
require_relative "./../util/util"

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
        @board[i][j] = Cell.new(nil, color, Point.new(i, j))
        color = !color
      end
    end

    setWhitePiecesList
    setBlackPiecesList
    setWhitePieces
    setBlackPieces
  end

  # def getBoard
  #   for i in 0..7
  #     for j in 0..7
  #       puts "Location #{i}-#{j}"
  #       puts "x-axis #{@board[i][j].position.x}"
  #       puts "y-axis #{@board[i][j].position.y}"
  #       puts "Color #{@board[i][j].color}"
  #     end
  #   end
  # end

  def setBlackPiecesList
    for i in 0..7
      @blackPiecesList[i] = Pawn.new("Black",Point.new(i, 6))
    end
    @blackPiecesList[8] = Rook.new("Black",Point.new(0, 7))
    @blackPiecesList[9] = Knight.new("Black",Point.new(1, 7))
    @blackPiecesList[10] = Bishop.new("Black",Point.new(2, 7))
    @blackPiecesList[11] = King.new("Black",Point.new(3, 7))
    @blackPiecesList[12] = Queen.new("Black",Point.new(4, 7))
    @blackPiecesList[13] = Bishop.new("Black",Point.new(5, 7))
    @blackPiecesList[14] = Knight.new("Black",Point.new(6, 7))
    @blackPiecesList[15] = Rook.new("Black",Point.new(7, 7))
  end


  def setWhitePiecesList
    for i in 0..7
      @whitePiecesList[i] = Pawn.new("White",Point.new(i,1))
    end
    @whitePiecesList[8] = Rook.new("White",Point.new(0, 0))
    @whitePiecesList[9] = Knight.new("White",Point.new(1, 0))
    @whitePiecesList[10] = Bishop.new("White",Point.new(2, 0))
    @whitePiecesList[11] = King.new("White",Point.new(3, 0))
    @whitePiecesList[12] = Queen.new("White",Point.new(4, 0))
    @whitePiecesList[13] = Bishop.new("White",Point.new(5, 0))
    @whitePiecesList[14] = Knight.new("White",Point.new(6, 0))
    @whitePiecesList[15] = Rook.new("White",Point.new(7, 0))
  end

  def setWhitePieces
    @board[0][0].piece = @whitePiecesList[8]
    @board[1][0].piece = @whitePiecesList[9]
    @board[2][0].piece = @whitePiecesList[10]
    @board[3][0].piece = @whitePiecesList[11]
    @board[4][0].piece = @whitePiecesList[12]
    @board[5][0].piece = @whitePiecesList[13]
    @board[6][0].piece = @whitePiecesList[14]
    @board[7][0].piece = @whitePiecesList[15]

    for j in 0..7
      @board[j][1].piece = @whitePiecesList[j]
    end
  end

  def setBlackPieces
    @board[0][7].piece = @blackPiecesList[8]
    @board[1][7].piece = @blackPiecesList[9]
    @board[2][7].piece = @blackPiecesList[10]
    @board[3][7].piece = @blackPiecesList[11]
    @board[4][7].piece = @blackPiecesList[12]
    @board[5][7].piece = @blackPiecesList[13]
    @board[6][7].piece = @blackPiecesList[14]
    @board[7][7].piece = @blackPiecesList[15]
    for j in 0..7
      @board[j][6].piece = @blackPiecesList[j]
    end
  end

  def getAllNotCapturedPieces
    return getWhiteNotCapturedPieces.concat getBlackNotCapturedPieces
  end

  def getWhiteNotCapturedPieces
    return getWhitePiecesOnBoard(false)
  end

  def getBlackNotCapturedPieces
    return getBlackPiecesOnBoard(false)
  end

  def getWhiteCapturedPieces
    return getWhitePiecesOnBoard(true)
  end

  def getBlackCapturedPieces
    return getBlackPiecesOnBoard(true)
  end

  def getWhitePiecesOnBoard(captured)
    piecesList = []

    for i in 0..15
      if(@whitePiecesList[i].isCaptured == captured)
        piecesList.push(@whitePiecesList[i])
      end
    end

    return piecesList
  end

  def getBlackPiecesOnBoard(captured)
    piecesList = []

    for i in 0..15
      if(@blackPiecesList[i].isCaptured == captured)
        piecesList.push(@blackPiecesList[i])
      end
    end

    return piecesList
  end

  def getWhitePiecesList
    return @whitePiecesList
  end

  def getBlackPiecesList
    return @blackPiecesList
  end


  def getAvailableMoves(turn, position)
    if !validatePosition(position)
      return "Not a valid position"
    end

    cellCoords = getCellCoordinates(position)
    pieceOnPosition = @board[cellCoords.x][cellCoords.y].piece

    if !pieceOnPosition
      return "Position is Empty"
    end

    if (turn && pieceOnPosition.color == "Black") ||
      (!turn && pieceOnPosition.color == "White")
      return "Please Select a piece of yours"
    end

    return pieceOnPosition.getAvailableMoves(@board)
  end

  def move(turn, position, finalPosition)
    if !validatePosition(position)
      return "Not a valid position"
    end

    cellCoords = getCellCoordinates(position)
    finalCoords = getCellCoordinates(finalPosition)
    pieceOnPosition = @board[cellCoords.x][cellCoords.y].piece

    if !pieceOnPosition
      return "Position is Empty"
    end

    if (turn && pieceOnPosition.color == "Black") ||
      (!turn && pieceOnPosition.color == "White")
      return "Please Select a piece of yours to move"
    end

    if pieceOnPosition.getAvailableMoves(@board).include?(finalPosition)
      pieceOnPosition.move(@board, finalCoords)
      return "Piece Moved Successfully"
    end

    return "Not a valid position to Move"
  end

  attr_accessor :board
end
