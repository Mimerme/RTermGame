class GameObject
  def initialize(sprite, position_x, position_y, object_data)
    @sprite = sprite
    @x = position_x
    @y = position_y
    @object_data = object_data
  end

  def start
    puts "Starting Gameoject"
  end

  def update
  end

  def get_x
    return @x
  end

  def get_y
    return @y
  end

  def get_sprite
    return @sprite
  end

  def get_data
    return @object_data
  end

end
