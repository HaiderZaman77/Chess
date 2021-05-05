require_relative "./piece"

class King < Piece
  def initialize(color, position)
    super("King", color, position)
  end
end
