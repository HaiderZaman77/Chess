require_relative "./../board/board"
require 'io/console'


class Game
  def initialize
    @turn = true
    @chessBoard = Board.new
  end

  def start
    puts "***************************************"
    puts "**                                   **"
    puts "**         Game Started              **"
    puts "**                                   **"
    puts "***************************************"
    puts "\n\n\n"
    @chessBoard.setBoard
    runGame
  end

  def displayGamePlayOptions
    puts "*************************************************************************"
    puts "**                                                                     **"
    puts "**                        Game Play Options                            **"
    puts "**                          #{@turn? "White's Turn" : "Black's Turn"}                               **"
    puts "**                                                                     **"
    puts "*************************************************************************"
    puts "**             1 -> All Uncaptured Pieces                              **"
    puts "**             2 -> Your Uncaptured Pieces                             **"
    puts "**             3 -> Opponent's Uncaptured Pieces                       **"
    puts "**             4 -> Your Available Moves                               **"
    puts "**             5 -> Positions of Your pieces                           **"
    puts "**             6 -> Positions of opponent's pieces                     **"
    puts "**             7 -> List of your captured Pieces                       **"
    puts "**             8 -> List of opponent's captured Pieces                 **"
    puts "**             9 -> Move a specific piece                              **"
    puts "**            10 -> Retire                                             **"
    puts "*************************************************************************"
  end

  def getChoice
    return gets.to_i
  end

  def log(message)
    puts "\n\n #{message} \n\n\n"
  end

  def runGame
    loop do
      displayGamePlayOptions

      print "\n\n Enter your selection number : "
      choice = getChoice

      case choice
      when 1
        showPieces(@chessBoard.getAllNotCapturedPieces)

      when 2
        @turn? showPieces(@chessBoard.getWhiteNotCapturedPieces) : showPieces(@chessBoard.getBlackNotCapturedPieces)

      when 3
        !@turn? showPieces(@chessBoard.getWhiteNotCapturedPieces) : showPieces(@chessBoard.getBlackNotCapturedPieces)

      when 4
        print "\n\n Enter the piece's position : "
        position = gets
        moves = @chessBoard.getAvailableMoves(@turn, position.strip!)

        if (moves.is_a?(String))
          log(moves)
        else
          showMoves(moves)
        end
      when 5
        if @turn
          showPieces(@chessBoard.getWhiteNotCapturedPieces)
        else
          showPieces(@chessBoard.getBlackNotCapturedPieces)
        end

      when 6
        !@turn? showPieces(@chessBoard.getBlackCapturedPieces) : showPieces(@chessBoard.getWhiteCapturedPieces)

      when 7
        @turn? showPieces(@chessBoard.getWhiteCapturedPieces) : showPieces(@chessBoard.getBlackCapturedPieces)

      when 8
        !@turn? showPieces(@chessBoard.getWhiteCapturedPieces) : showPieces(@chessBoard.getBlackCapturedPieces)

      when 9
        print "\n\n Enter the piece's current position : "
        currentPosition = gets
        print "\n\n Enter the piece's final position : "
        finalPosition = gets
        log(@chessBoard.move(@turn, currentPosition.strip!, finalPosition.strip!))
      when 10
        log("Are you Sure? Opponent will be declared as winner.")

        loop do
          puts "1 -> Yes"
          puts "2 -> No"
          print "Choice : "

          playersChoice = getChoice

          case playersChoice
          when 1
            log(" !!!!!!!!!!! #{@turn? "Black" : "White"} Won the Game !!!!!!!!!!!")
            break
          when 2
            log("Decision Cancelled")
            break
          else
            log("Please select from the available choices")
          end
        end

      else
        log("Please choose from the given options")
      end
    end
  end

  def showPieces(pieces)
    if pieces.length() == 0
      log("No Piece found")
    else
      print "\n\n"
      for i in 0...pieces.length()
        puts "***************************************"
        puts "**         Piece #: #{i+1}                **"
        puts "**         Name: #{pieces[i].name}                **"
        puts "**         Color: #{pieces[i].color}              **"
        puts "**         Position: #{getCellIdentifier(pieces[i].position)}              **"
        puts "***************************************"
      end
      puts "\n\n\n"
    end
  end

  def showMoves(moves)
    if moves.length() == 0
      log("No Available Moves")
    else
      print "\n\n"
      puts "*************************"
      for i in 0...moves.length()
      puts "**                     **"
      puts "**        #{moves[i]}           **"
      puts "**                     **"
      end
      puts "*************************"
      puts "\n\n\n"
    end
  end
end
