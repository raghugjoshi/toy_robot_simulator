class Compass
	DIRECTIONS = %w(EAST WEST NORTH SOUTH).freeze

  LEFT_MOVE_MAPPINGS_90_DEGREE = {
    DIRECTIONS[0] => 'NORTH',
    DIRECTIONS[1] => 'SOUTH',
    DIRECTIONS[2] => 'WEST',
    DIRECTIONS[3] => 'EAST'
  }

  RIGHT_MOVE_MAPPINGS_90_DEGREE = {
    DIRECTIONS[0] => 'SOUTH',
    DIRECTIONS[1] => 'NORTH',
    DIRECTIONS[2] => 'EAST',
    DIRECTIONS[3] => 'WEST'
  }

  def self.move_left(direction)
    LEFT_MOVE_MAPPINGS_90_DEGREE[direction]
  end

  def self.move_right(direction)
    RIGHT_MOVE_MAPPINGS_90_DEGREE[direction]
  end

end
