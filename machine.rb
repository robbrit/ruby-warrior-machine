module Machine
  def self.included base
    base.class_eval do
      @@instructions = {}

      def self.instruction name, &block
        @@instructions[name] = block
      end

      def self.random_program length = 100
        res = @@instructions.keys
        (1..length).map do |i|
          res[rand(res.length)]
        end
      end
    end
  end

  def initialize
    @ip = 0
    @code = []
  end

  def load_code code
    @code =
      if code.is_a? String
        code.split(/\r?\n/)
      else
        code
      end
  end

  def step
    instance_eval &@@instructions[@code[@ip]]
    skip
  end

  def peek_instruction i = 1
    @code[(@ip + i) % @code.length]
  end

  def skip i = 1
    @ip = (@ip + i) % @code.length
  end
end
