#Library is powered entirely without the Curses library
#Allows for cross-platform support

#Graphics object
require './RenderFactory.rb'

class TerminalGame

  def initialize(name, width, height)
    @game_name = name
    @game_width = width
    @game_height = height
    @gameobjects = {}
    @logic_bits_start = {}
    @logic_bits_update = {}
    @graphics_factory = RenderFactory.new(9,9)
  end

  def add_gameobject(gameobject_id, gameobject)
    @gameobjects[gameobject_id] = gameobject
  end

  def add_logic(logic_id, logic_start, logic_update)
    #Only add the logic bits if they are defined
    logic_start != nil ? @logic_bits_start[logic_id] = logic_start : :nothing
    logic_update != nil ? @logic_bits_update[logic_id] = logic_update : :nothing
  end


  #Start the game loop
  def begin_loop
    @gameobjects.each do |id, gameobject|
      gameobject.start
    end
      @logic_bits_start.each do |id, logic_bit|
        logic_bit.call
    end

   #Run and update on every gameobject
   while true

     #Pause each frame. Modern computers render too fast
     sleep 0.1

     @logic_bits_update.each do |id, logic_bit|
       logic_bit.call
     end

     @gameobjects.each do |id, gameobject|
       gameobject.update
     end

     @graphics_factory.clear_screen

     @gameobjects.each do |id, gameobject|
       @graphics_factory.buffer_at_position(gameobject.get_x, gameobject.get_y, gameobject.get_sprite)
     end

     @graphics_factory.draw

  end
 end

  def get_width
    return @game_width
  end

  def get_height
    return @game_height
  end

  def get_name
    return @game_name
  end

end
