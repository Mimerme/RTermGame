require 'colorize'
require './GameObject'
require './PlayerObject'
require './TerminalGame'
require './keypress'
require './RTermGame.rb'
require './TetrisDemo/TetrisGame.rb'

tetris = TetrisGame.new(:Tetris, 30, 20)
tetris.begin_loop
