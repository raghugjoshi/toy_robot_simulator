class Table < ApplicationRecord

  # Associations
  validates :width,
            numericality: { only_integer: true, greater_than: 0 }

  validates :height,
            numericality: { only_integer: true, greater_than: 0 }
end

