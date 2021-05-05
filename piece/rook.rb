require_relative "./piece"

class Rook < Piece
  def initialize(color, position)
    super("Rook", color, position)
  end
end
