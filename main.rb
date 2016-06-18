#!/bin/env ruby
# encoding: utf-8

require 'colorize'
require './GameObject'
require './PlayerObject'
require './TerminalGame'
require './keypress'
require './RTermGame.rb'

#Terminal Game only acceptes tile based gameass GameObject


#meme = GameObject.new("O", 0, 0, nil)
#dope = GameObject.new("I", 1, 0, nil)
#kek = GameObject.new("E", 1, 1, nil)

tetris = TerminalGame.new(:Tetris, 20, 20)

player = PlayerObject.new('U',0, 0, nil, tetris)


tetris.add_gameobject(player)
#tetris.add_gameobject(:test, dope)
#tetris.add_gameobject(:pepe, kek)

puts tetris.get_gameobject_at(player.get_x, player.get_y)
sleep(1)

tetris.begin_loop
