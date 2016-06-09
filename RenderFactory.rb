require './RTermGame.rb'
require './RTermGame.rb'

class RenderFactory

  def initialize(size_x, size_y)
    @size_x = size_x
    @size_y = size_y
    #| ->
    #down ->
    @screen_buffer = Array.new(@size_y) {Array.new(@size_x) {:empty}}
  end
  #Clears the screen to setup for the next frame
  def clear_screen
    system "clear" or system "cls"
  end

  def buffer_at_position(x_pos, y_pos, sprite)
    @screen_buffer[y_pos][x_pos] = sprite
  end

  #dumps the current screen buffer
  def draw
    @screen_buffer.each do |buffer_x|
      line_buffer = ""
      buffer_x.each do |char_sprite|
        if char_sprite != :empty
          line_buffer << char_sprite
        else
          line_buffer << " "
        end
      end
      RTermGame.println line_buffer
      @screen_buffer = Array.new(@size_y) {Array.new(@size_x) {:empty}}
    end
  end
end
