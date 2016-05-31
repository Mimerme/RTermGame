
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
    @screen_buffer[x_pos][y_pos] = sprite
  end

  #dumps the current screen buffer
  def draw
    @screen_buffer.each do |buffer_x|
      line_buffer = ""
      buffer_x.each do |char_sprite|
        if char_sprite != :empty
          line_buffer << char_sprite
        end
      end
      puts line_buffer
    end
  end
end
