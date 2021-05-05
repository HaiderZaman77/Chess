require_relative "./piece"

class Pawn < Piece
  def initialize(color, position)
    super("Pawn", color, position)
  end
end

