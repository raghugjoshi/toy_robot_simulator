class ToyRobotSimulator
  attr_accessor :toy_robot
  attr_reader :table

  def initialize(toy_robot, table)
    @toy_robot = toy_robot
    @table = table
  end

  def place(position_x, position_y, direction = Compass::DIRECTIONS[2])
    can_the_toy_robot_be_placed?(position_x, position_y) do
      toy_robot.update({ position_x: position_x, position_y: position_y, direction: direction.upcase })
    end
  end

  def move
    is_toy_robot_placed_on_table? do
      case toy_robot.direction
      when Compass::DIRECTIONS[0]
        if (toy_robot.position_x + 1) <= (table.width - 1)
          toy_robot.update({ position_x: toy_robot.position_x + 1 })
        else
          'Toy_robot is at the extreme right edge. This move will cause the toy_robot to fall!! Hence it is not allowed'
        end
      when Compass::DIRECTIONS[1]
        if (toy_robot.position_x - 1) >= 0
          toy_robot.update({ position_x: toy_robot.position_x - 1 })
        else
          'Toy_robot is at the extreme left edge. This move will cause the toy_robot to fall!! Hence it is not allowed'
        end
      when Compass::DIRECTIONS[2]
        if (toy_robot.position_y + 1) <= (table.height - 1)
          toy_robot.update( { position_y: toy_robot.position_y + 1 })
        else
          'Toy_robot is at the extreme top edge. This move will cause the toy_robot to fall!! Hence it is not allowed'
        end
      else
        if (toy_robot.position_y - 1) >= 0
          toy_robot.update( { position_y: toy_robot.position_y - 1})
        else
          'Toy_robot is at the extreme bottom edge. This move will cause the toy_robot to fall!! Hence it is not allowed'
        end
      end
    end
  end

  def left
    is_toy_robot_placed_on_table? do
      toy_robot.update({ direction: Compass.move_left(toy_robot.direction) })
    end
  end

  def right
    is_toy_robot_placed_on_table? do
      toy_robot.update({ direction: Compass.move_right(toy_robot.direction) })
    end
  end

  def report
    "#{toy_robot.full_name}'s current position - x = #{toy_robot.position_x}, y = #{toy_robot.position_y} and direction = #{toy_robot.direction}"
  end

  private

  def is_toy_robot_placed_on_table?
    if (!toy_robot.position_x.nil? && !toy_robot.position_y.nil? && !toy_robot.direction.nil? )
      yield
    else
      "Toy_robot named #{toy_robot.full_name} is not yet placed on the table"
    end
  end

  def can_the_toy_robot_be_placed?(position_x, position_y)
    if position_x >= 0 && position_x <= (table.width - 1) && position_y >= 0 && position_y <= (table.height - 1)
      yield
    else
      "Toy_robot named #{toy_robot.full_name} cannot be placed on the table at position x - #{position_x}, position y - #{position_y}"
    end
  end

end
