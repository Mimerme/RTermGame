require './RTermGame.rb'

class GameObject
  def initialize(sprite, position_x, position_y, object_data, game_world)
    @sprite = sprite
    @x = position_x
    @y = position_y
    @object_data = object_data
    @game_world = game_world
  end

  def start
    RTermGame.println "Starting Gameobject"
  end

  def update
  end

  def get_x
    return @x
  end

  def get_y
    return @y
  end

  def set_x(val_x)
    @x = val_x
  end

  def set_y(val_y)
    @y = val_y
  end

  def get_sprite
    return @sprite
  end

  def get_data
    return @object_data
  end

end
