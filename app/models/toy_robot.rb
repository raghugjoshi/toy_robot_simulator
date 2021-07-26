class ToyRobot < ApplicationRecord

  # Associations
  validates :full_name, presence: true
  validates :position_x, :position_y, 
            numericality: { only_integer: true, greater_than_or_equal_to: 0 },
            allow_nil: true

  validates :direction, 
            inclusion: { in: Compass::DIRECTIONS },
            allow_nil: true

end
