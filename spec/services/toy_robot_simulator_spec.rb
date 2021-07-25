require 'rails_helper'

RSpec.describe ToyRobotSimulator, type: :model do
  describe 'ToyRobotSimulator' do 
    let(:squre_table) { FactoryBot.create(:table) }
    let(:rectangle_table) { FactoryBot.create(:table, width: 8, height: 4) }
    let(:toy_robot) { FactoryBot.create(:toy_robot) }
    let(:toy_robot_simulator) { ToyRobotSimulator.new(toy_robot, squre_table) }
    let(:trs_for_rectangle_table) { ToyRobotSimulator.new(toy_robot, rectangle_table) }

    context 'when the table is square' do
      context 'when toy_robot is not paced on the square table' do

        it 'discards #move command' do
          toy_robot_simulator.move
          toy_robot_positional_expectations(toy_robot, nil, nil, nil)
        end

        it 'discards #left command' do
          toy_robot_simulator.left
          toy_robot_positional_expectations(toy_robot, nil, nil, nil)
        end

        it 'discards #right command' do
          toy_robot_simulator.right
          toy_robot_positional_expectations(toy_robot, nil, nil, nil)
        end

        it 'accepts #place command' do
          toy_robot_simulator.place(0, 0, 'NORTH')
          toy_robot_positional_expectations(toy_robot, 0, 0, 'NORTH')
        end

        it 'accepts #report command' do
          toy_robot_simulator.report
          toy_robot_positional_expectations(toy_robot, nil, nil, nil)
        end
      end
      context 'when the toy_robot is placed on the square table' do
        before(:each) do
          toy_robot_simulator.place(0,0, Compass::DIRECTIONS[2])
        end

        it 'moves' do
          toy_robot_simulator.move
          toy_robot_positional_expectations(toy_robot, 0, 1, 'NORTH')
        end

        it 'rotates left by 90 degree' do
          toy_robot_simulator.move
          toy_robot_simulator.left
          toy_robot_positional_expectations(toy_robot, 0, 1, 'WEST')
        end

        it 'rotates right by 90 degree' do
          toy_robot_simulator.move
          toy_robot_simulator.right
          toy_robot_positional_expectations(toy_robot, 0, 1, 'EAST')
        end

        it 'reports the current postion of toy_robot on the table' do
          expect(toy_robot_simulator.report).to eq("#{toy_robot.full_name}'s current position - x = 0, y = 0 and direction = NORTH")
        end
      end
    end

    context 'when the table is rectangle in shape' do
      context 'when toy_robot is not paced the rectangle table' do

        it 'discards #move command' do
          trs_for_rectangle_table.move
          toy_robot_positional_expectations(toy_robot, nil, nil, nil)
        end

        it 'discards #left command' do
          trs_for_rectangle_table.left
          toy_robot_positional_expectations(toy_robot, nil, nil, nil)
        end

        it 'discards #right command' do
          trs_for_rectangle_table.right
          toy_robot_positional_expectations(toy_robot, nil, nil, nil)
        end

        it 'accepts #place command' do
          trs_for_rectangle_table.place(0, 0, 'NORTH')
          toy_robot_positional_expectations(toy_robot, 0, 0, 'NORTH')
        end

        it 'accepts #report command' do
          trs_for_rectangle_table.report
          toy_robot_positional_expectations(toy_robot, nil, nil, nil)
        end
      end
    end

  end

  def toy_robot_positional_expectations(toy_robot, position_x, position_y, direction)
    expect(toy_robot.position_x).to eq(position_x)
    expect(toy_robot.position_y).to eq(position_y)
    expect(toy_robot.direction).to eq(direction)
  end
end

