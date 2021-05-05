require_relative "./board/board"

puts "Game Started"

chessBoard = Board.new
chessBoard.setBoard

nonCapturedPieces = chessBoard.getNotCapturedPieces
capturedPieces = chessBoard.getCapturedPieces

for i in 0..nonCapturedPieces.length()-1
  puts "***************************************"
  puts "**         Name: #{nonCapturedPieces[i].name}                **"
  puts "**         Color: #{nonCapturedPieces[i].color}              **"
  puts "**         Position: #{getCellIdentifier(nonCapturedPieces[i].position)}              **"
  puts "***************************************"
end

puts "\n\n Captured Pieces\n\n"
puts capturedPieces
# if(capturedPieces == 0)
#   puts "No Piece has been captured yet"
# else
#   for i in 0..capturedPieces.length()-1
#     puts "***************************************"
#     puts "**         Name: #{capturedPieces[i].name}                **"
#     puts "**         Color: #{capturedPieces[i].color}              **"
#     puts "**         Position: #{getCellIdentifier(capturedPieces[i].position)}              **"
#     puts "***************************************"
#   end
# end

