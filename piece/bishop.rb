require_relative "./piece"

class Bishop < Piece
  def initialize(color, position)
    super("Bishop", color, position)
  end
end

