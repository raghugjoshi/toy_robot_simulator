require 'rails_helper'

RSpec.describe ToyRobot, type: :model do
  describe 'ToyRobot' do 
    let(:toy_robot) { build(:toy_robot) }
    
    describe 'database_columns' do
      it 'should have column named full_name' do
        should have_db_column(:full_name).of_type(:string)
      end

      it 'should have column named full_name' do
        should have_db_column(:position_x).of_type(:integer)
      end

      it 'should have column named full_name' do
        should have_db_column(:position_y).of_type(:integer)
      end

      it 'should have column named full_name' do
        should have_db_column(:direction).of_type(:string)
      end
    end

    describe 'validations' do 
      before(:each) do 
        expect(toy_robot).to be_valid
      end

      describe 'full_name' do 
        it 'validates full_name for nil value' do
          toy_robot.full_name = nil
          expect(toy_robot).to be_invalid
        end
      end

      describe 'position_x' do 
        it 'validates position_x for nil value' do
          toy_robot.position_x = nil
          expect(toy_robot).to be_valid
        end

        it 'validates position_x for string value' do
          toy_robot.position_x = 'hello' 
          expect(toy_robot).to be_invalid
        end
      end

      describe 'position_y' do 
        it 'validates position_y for nil value' do
          toy_robot.position_y = nil
          expect(toy_robot).to be_valid
        end

        it 'validates position_y for string value' do
          toy_robot.position_y = 'hello' 
          expect(toy_robot).to be_invalid
        end
      end

      describe 'direction' do 
        it 'validates direction for nil value' do
          toy_robot.direction = nil
          expect(toy_robot).to be_valid
        end

        it 'validates direction for numerical value' do
          toy_robot.direction = 50 
          expect(toy_robot).to be_invalid
        end
      end
    end
  end
end
