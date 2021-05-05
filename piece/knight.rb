require_relative "./piece"

class Knight < Piece
  def initialize(color, position)
    super("Knight", color, position)
  end
end

