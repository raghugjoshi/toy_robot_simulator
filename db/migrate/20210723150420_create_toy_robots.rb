class CreateToyRobots < ActiveRecord::Migration[6.1]
  def change
    create_table :toy_robots do |t|
      t.string        :full_name
      t.integer       :position_x
      t.integer       :position_y
      t.string        :direction
      t.timestamps
    end
  end
end
