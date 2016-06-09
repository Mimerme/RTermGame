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
require './RTermGame.rb'

#Terminal Game only acceptes tile based gameass GameObject


#meme = GameObject.new("O", 0, 0, nil)
#dope = GameObject.new("I", 1, 0, nil)
#kek = GameObject.new("E", 1, 1, nil)

tetris = TerminalGame.new(:Tetris, 20, 20)

player = PlayerObject.new('U',3, 0, nil, tetris)


tetris.add_gameobject(:player, player)
#tetris.add_gameobject(:test, dope)
#tetris.add_gameobject(:pepe, kek)

tetris.begin_loop
