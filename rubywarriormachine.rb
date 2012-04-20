require_relative 'machine'

class RubyWarriorMachine
  include Machine

  def initialize
    super
    @stack = []
    @exclaimed = false
    @registers = {
      :a => 0, :b => 0, :c => 0
    }
    @direction = :forward
    @maxhealth = nil
  end

  def exclaimed?; @exclaimed; end

  def warrior= warrior
    @maxhealth ||= warrior.health if warrior.respond_to? :health

    @warrior = warrior
    @exclaimed = false
  end

  #####################
  #  Instruction Set  #
  #####################

  # nops do nothing
  instruction "nop-A" do; end
  instruction "nop-B" do; end
  instruction "nop-C" do; end

  instruction "push" do
    @stack << @registers[register]
  end

  instruction "pop" do
    @registers[register] = @stack.pop if @stack.length > 0
  end

  instruction "walk" do
    if @warrior.respond_to? :walk!
      @warrior.walk! @direction
      @exclaimed = true
    end
  end

  instruction "attack" do
    if @warrior.respond_to? :attack!
      @warrior.attack! @direction
      @exclaimed = true
    end
  end
  
  instruction "rest" do
    if @warrior.respond_to? :rest!
      @warrior.rest!
      @exclaimed = true
    end
  end
  
  instruction "bind" do
    if @warrior.respond_to? :bind!
      @warrior.bind! @direction
      @exclaimed = true
    end
  end
    
  instruction "rescue" do
    if @warrior.respond_to? :rescue!
      @warrior.rescue! @direction
      @exclaimed = true
    end
  end

  instruction "turn" do
    @direction = @direction == :forward ? :backward : :forward
  end

  instruction "jempty" do
    skip if @warrior.feel.empty? if @warrior.respond_to? :feel
  end

  instruction "jstairs" do
    skip if @warrior.feel.stairs? if @warrior.respond_to? :feel
  end
  
  instruction "jenemy" do
    skip if @warrior.feel.enemy? if @warrior.respond_to? :feel
  end

  instruction "jcaptive" do
    skip if @warrior.feel.captive? if @warrior.respond_to? :feel
  end
  
  instruction "jwall" do
    skip if @warrior.feel.wall? if @warrior.respond_to? :feel
  end
  
  instruction "jticking" do
    skip if @warrior.feel.ticking? if @warrior.respond_to? :feel
  end

  instruction "jhealthlow" do
    skip if @warrior.respond_to?(:health) and @warrior.health < @maxhealth * 0.2
  end

  instruction "jhealthhigh" do
    skip if @warrior.respond_to?(:health) and @warrior.health > @maxhealth * 0.7
  end

  def register
    case peek_instruction
    when "nop-A"
      :a
    when "nop-C"
      :c
    else
      :b
    end
  end
end
