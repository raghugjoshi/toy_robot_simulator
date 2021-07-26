class ToyRobotsController < ApplicationController
  before_action :fetch_toy_robot_and_table, except: [:show]

  def home
    @toy_robot.update({ position_x: nil, position_y: nil, direction: nil}) if @toy_robot.present?
  end

  def simulate
    # Read file and perform operations accordingly
    document = Document.new(document_params)
    if document.valid?
      FileCommandProcessor.new(document).process(@toy_robot, @table)
      redirect_to toy_robot_path(id: @toy_robot.id)
    else
      flash[:error] = 'Testing error message'
      redirect_to root_path
    end
  end

  def show
    @toy_robot = ToyRobot.find_by_id params[:id]
  end

  private

  def fetch_toy_robot_and_table
    @toy_robot = ToyRobot.first
    @table = Table.first
  end

  def document_params
    params.require(:document).permit(:name)
  end

end
