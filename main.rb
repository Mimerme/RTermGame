#!/bin/env ruby
# encoding: utf-8

require 'colorize'
require './GameObject'
require './PlayerObject'
require './TerminalGame'
require './keypress'
require 'io/console'
require 'timeout'
require 'curses'

#Terminal Game only acceptes tile based gameass GameObject


meme = GameObject.new("O", 0, 0, nil)
dope = GameObject.new("I", 1, 0, nil)
kek = GameObject.new("E", 1, 1, nil)
player = PlayerObject.new('U', 2, 2, nil)

tetris = TerminalGame.new(:Tetris, 1, 2)


tetris.add_gameobject(:player, player)
tetris.add_gameobject(:test, dope)
tetris.add_gameobject(:pepe, kek)

tetris.add_logic(:keyboard,
  Proc.new {
    puts "Initalizing Keyboard Logic"
  }, nil)

tetris.begin_loop

puts tetris.get_width

puts "████".green
