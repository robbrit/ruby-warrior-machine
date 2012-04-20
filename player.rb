require_relative "../../rubywarriormachine"

$machine = RubyWarriorMachine.new

code = File.read(File.dirname(__FILE__) + "/../../code").split("\n")

$machine.load_code code

MaxSteps = 1000

class Player
  def initialize
    super
    @turn_num = 0
  end

  def play_turn warrior
    $machine.warrior = warrior

    i = 0
    while !$machine.exclaimed? and i < MaxSteps
      $machine.step
      i += 1
    end

    if @turn_num > 100
      # took too long
      exit
    end

    @turn_num += 1
  end
end
