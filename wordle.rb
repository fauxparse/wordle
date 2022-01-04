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
