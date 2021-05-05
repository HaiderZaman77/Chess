$letterMapping = ["A", "B", "C", "D", "E", "F", "G", "H"]
$numberMapping = [1, 2, 3, 4, 5, 6, 7, 8]

def getCellIdentifier(position)
  return $letterMapping[position.x] + $numberMapping[position.y].to_s
end
