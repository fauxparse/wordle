require 'rubygems'
require 'bundler/setup'
require 'colorize'

require './dictionary'
require './clue'
require './game'
require './player'

dictionary = Dictionary.new

game = Game.new(dictionary)

player = Player.new(game)

player.play

# Uncomment for 'interactive mode': you can use this to play the 'real' wordle
# The computer will give you a word to try and then wait for the response as a 5-character string:
# + = green
# - = yellow
# x = black

# player.interactive
