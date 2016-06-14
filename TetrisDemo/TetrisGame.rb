require_relative "../TerminalGame.rb"
require_relative "./tetromono.rb"
require_relative "../RTermGame"

class TetrisGame < TerminalGame

def spawn_test_tetromono(type)
  @active_falling = Tetromono.new(15, 1, self, type)
end

def loop_update_begin
  @active_falling.add_pieces_to_buffer
end

def loop_update_end
  @active_falling.apply_gravity_step
end

def loop_start
  spawn_test_tetromono(:line_block)
end

end
