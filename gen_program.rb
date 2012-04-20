require_relative "rubywarriormachine"

code = RubyWarriorMachine.random_program

File.open("code", "w") do |file|
  file.write code.join("\n")
end
