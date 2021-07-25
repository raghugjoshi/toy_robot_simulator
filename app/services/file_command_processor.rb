class FileCommandProcessor
  attr_reader :document
  attr_accessor :commands

  VALID_COMMANDS = %w(PLACE MOVE LEFT RIGHT REPORT).freeze

  def initialize(document)
    @document = document
    @commands = []
  end

  def process(toy_robot, table)
    is_document_present?(document) do
      File.foreach(document.name.path) do |line|
        cmd, args = line.strip.split(' ')
        next unless VALID_COMMANDS.include?(cmd)
        commands << {
          cmd: cmd.downcase.to_sym,
          args: args.to_s.split(',')
        }
      end
      commands.each do |command|
        toy_robot_simulator = ToyRobotSimulator.new(toy_robot, table)
        if command[:args].present?
          next unless Compass::DIRECTIONS.include?(command[:args].last)
          toy_robot_simulator.send(command[:cmd], command[:args][0].to_i, command[:args][1].to_i, command[:args][2])
        else
          toy_robot_simulator.send(command[:cmd])
        end
      end
    end
  end

  private

  def is_document_present?(document)
    yield if document.present? and @document.valid?
  end
end
