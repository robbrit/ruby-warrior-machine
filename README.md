Description
===========

The creators of an evolutionary program engine called [Avida](https://en.wikipedia.org/wiki/Avida) discovered that certain assembly languages are more robust to random mutation and cross-over than others. The RubyWarriorMachine project applies this idea to play the [RubyWarrior game](https://github.com/ryanb/ruby-warrior) by generating and selecting RubyWarriorMachines that are able to play this game well.

Requirements
============

This program requires RubyWarrior:

  gem install rubywarrior


Usage
=====

1) Generate a program:

  ruby gen_program.rb

2) Run the program:

  ruby runner.rb

This will not display anything for a while if the robot ends up just wandering aimlessly. The engine will quit after 100 actions (the robot should figure out what to do by then) however this does not guarantee that the program will end.
