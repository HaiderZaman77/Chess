require_relative "./point"

$letterMapping = ["H", "G", "F", "E", "D", "C", "B", "A"]
$numberMapping = [1, 2, 3, 4, 5, 6, 7, 8]

def getCellIdentifier(position)
  return $letterMapping[position.x] + $numberMapping[position.y].to_s
end

def getCellCoordinates(position)
  cellCoords = position.split("")
  return Point.new(($letterMapping.index cellCoords[0]), ($numberMapping.index cellCoords[1].to_i))
end

def validatePosition(position)
  positionCoords = position.split("")
  if((positionCoords[0].ord < 65 || positionCoords[0].ord > 72) &&
    (positionCoords[0].ord < 97 || positionCoords[0].ord > 104)) ||
    (positionCoords[1].ord < 48 || positionCoords[1].ord > 56)
    return false
  end

  return true
end
