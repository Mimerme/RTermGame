#Library is powered entirely without the Curses library
#Allows for cross-platform support

#Graphics object
require './RenderFactory.rb'
require './RTermGame.rb'
require './keypress.rb'
require 'io/console'


class TerminalGame

  def initialize(name, width, height)
    @game_name = name
    @game_width = width
    @game_height = height
    @gameobjects = {}
    #@logic_bits_start = {}
    #@logic_bits_update = {}
    @graphics_factory = RenderFactory.new(width,height)
    @gameobject_count = 0
  end


  def add_gameobject(gameobject)
    @gameobjects[@gameobject_count] = gameobject
    @gameobject_count+=1
  end
  #def add_logic(logic_id, logic_start, logic_update)
    #Only add the logic bits if they are defined
  #  logic_start != nil ? @logic_bits_start[logic_id] = logic_start : :nothing
  #  logic_update != nil ? @logic_bits_update[logic_id] = logic_update : :nothing
  #end

  #methods to be overriden by the superclass
  #called when the game starts
  def loop_start
  end

  #called at the beginning of each game loop
  def loop_update_begin
  end

  #called at the end of each game loop
 def loop_update_end
 end

  #Start the game loop
 def begin_loop


   Keyboard.begin_key_record
   @gameobjects.each do |id, gameobject|
     gameobject.start
   end
   #@logic_bits_start.each do |id, logic_bit|
   #    logic_bit.call
   #end

   loop_start

   begin
   loop do
     sleep (0.1)
     loop_update_begin

     @gameobjects.each do |id, gameobject|
       gameobject.update
     end

     @graphics_factory.clear_screen

     @gameobjects.each do |id, gameobject|
       @graphics_factory.buffer_at_position(gameobject.get_x, gameobject.get_y, gameobject.get_sprite)
     end

     #@logic_bits_update.each do |id, logic_bit|
    #   logic_bit.call
    # end

     loop_update_end

     @graphics_factory.draw

     Keyboard.reset_key_record
   end
 rescue SystemExit
   puts "Terminated Safely"
 rescue Exception => e
   time = Time.now
   RTermGame.println "\'#{@game_name}' ran into an exception during the game loop"
   RTermGame.println "Error Report Generated " + time.inspect
   RTermGame.println "==[Details]=============================================="
   RTermGame.println e.inspect
   RTermGame.println "==[Backtrace]=============================================="
   RTermGame.println e.backtrace.join("")
   quit_game "Exception Quit"
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

  def quit_game(quit_code)
    STDIN.cooked!
    puts quit_code
    Keyboard.end_thread
    exit
  end
  def get_gameobject_at(x_pos, y_pos)
    @gameobjects.each do |id, gameobject|
      if(gameobject.get_x == x_pos && gameobject.get_y == y_pos)
        return gameobject
      else
        return :none
      end
    end
  end

end
