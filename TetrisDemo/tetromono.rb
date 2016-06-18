require_relative "../GameObject.rb"
require_relative "../RTermGame"
require_relative "./tetro_piece.rb"

class Tetromono
  #normal tetris has 4 blocks in a 4x4 square, this version has 3 in a 3x3
  #tetromono_type must be defined as a symbol
  def initialize(position_x, position_y, game_world, tetromono_type)
    @tetromono_type = tetromono_type
    @tet_pieces = {}
    @x = position_x
    @y = position_y
    @game_world = game_world
    @falling = true

    #rotation key
    #===========
    #1 = default / 0
    #2 = 1 90 rotation to RIGHT
    #etc...
    @rotation = 1
    set_tetromono
  end

  def get_tet_pieces
    return @tet_pieces
  end

  def add_pieces_to_buffer
    @tet_pieces.each do |id, piece|
      @game_world.add_gameobject(piece)
    end
  end

  #called when the pieces touch the ground
  def release_pieces
    @game_world.release_active
  end

  def set_tetromono
    if @tetromono_type == :line_block
      @tet_pieces[0] = Tetro_Piece.new("O", @x, @y - 1, nil, @game_world)
      @tet_pieces[1] = Tetro_Piece.new("O", @x, @y, nil, @game_world)
      @tet_pieces[2] = Tetro_Piece.new("O", @x, @y + 1, nil, @game_world)
    else
      RTermGame.println "Invalid Tetromono Piece. Internal Error"
      game_world.quit_game
    end
  end

  def apply_gravity_step
    if !@falling
      return
    end

    @tet_pieces.each do |id, piece|

      if (piece.get_y + 1) >= @game_world.get_height
        release_pieces
        @falling = false
        return
      end
      puts @game_world.get_gameobject_at(9, 5)
      if @game_world.get_gameobject_at(piece.get_x, piece.get_y) != :none
        release_pieces
        @falling = false
        return
      end
    end
    @tet_pieces.each do |id, piece|
        piece.set_y(piece.get_y + 1)
    end
  end
end
