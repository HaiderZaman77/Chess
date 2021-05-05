require_relative "./piece"

class Queen < Piece
  def initialize(color, position)
    super("Queen", color, position)
  end
end
