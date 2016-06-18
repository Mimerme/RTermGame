require_relative "../TerminalGame.rb"
require_relative "./tetromono.rb"
require_relative "../RTermGame"
require_relative "../GameObject.rb"

class TetrisGame < TerminalGame


def release_active
  @active_falling.get_tet_pieces.each do |id, piece|
    add_gameobject(GameObject.new('U',piece.get_x, piece.get_y, nil, self))
  end
  @active_falling = Tetromono.new(9, 1, self, :line_block)
end

def spawn_test_tetromono(type)
  @active_falling = Tetromono.new(15, 1, self, type)
end

def loop_update_begin
  @active_falling.add_pieces_to_buffer
end

def loop_update_end
  @active_falling.apply_gravity_step
  if Keyboard.get_key_pressed "q"
    quit_game 1
  end
end

def loop_start
  spawn_test_tetromono(:line_block)
end

end
