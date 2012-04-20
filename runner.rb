require 'rubygems'
require 'ruby_warrior'
require 'fileutils'
require 'stringio'

input = StringIO.new
output = StringIO.new

input.puts "y"  # yes i'd like to create a new account
input.puts "2"  # choose beginner
input.puts "autobot" # name is "autobot"

`rm -r rubywarrior` if File.exists? "rubywarrior"

input.rewind
runner = RubyWarrior::Runner.new([], input, output)
runner.run

`cp player.rb rubywarrior/autobot-beginner`

input = StringIO.new
output = StringIO.new

input.puts "1"  # use existing account
input.puts "n"  # don't continue level
input.rewind

runner = RubyWarrior::Runner.new([], input, output)
runner.run
$>.puts output.string
