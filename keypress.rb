require 'io/console'


#hashmap of current keys down
@key_pressed = {}
@processed = false

#Attempt 3
#---------
#Nonblocking multithreaded cross-platform key-state recording
def begin_key_record
  Thread.new{
    loop do
      char = read_char
      #puts char
      @key_pressed[char] = char
    end
  }
end

def get_key_pressed(key)
  @processed = true
  return @key_pressed.key? key
end

#Calls to dump the key_record after a frame. MUST be called after all calls to get keys pressed are finished
def reset_key_record
  #resets keys pressed
  if @processed
    @key_pressed.clear
  end
  @processed = false
end
#Attempt 2
#---------
#Nonblocking cross-platform key-state fetching
def get_key_down(char)
  STDIN.echo = false
  STDIN.raw!
  begin
    #reads input without blocking the thread
    #returns a string of pressed keys
    input = STDIN.read_nonblock(3)
    #check if the key was pressed
    if(input.include? char)
      return true
    end
    return false
  rescue Errno::EAGAIN
    return false
  end
end

#Specifiy a character to see if it was presssed at that moment attempt number 1
def get_key(char)
Timeout::timeout(0){
    return read_char == char
}
return false
end

#Everything below this comment is  taken from https://gist.github.com/acook/4190379
#Check https://github.com/acook/remedy out for your own projects

# Reads keypresses from the user including 2 and 3 escape character sequences.
def read_char
  STDIN.raw!
  input = STDIN.getc.chr
  if input == "\e" then
    input << STDIN.read_nonblock(3) rescue nil
    input << STDIN.read_nonblock(2) rescue nil
  end
ensure
  return input
end

# oringal case statement from:
# http://www.alecjacobson.com/weblog/?p=75
def show_single_key
  c = read_char

  case c
  when " "
    puts "SPACE"
  when "\t"
    puts "TAB"
  when "\r"
    puts "RETURN"
  when "\n"
    puts "LINE FEED"
  when "\e"
    puts "ESCAPE"
  when "\e[A"
    puts "UP ARROW"
  when "\e[B"
    puts "DOWN ARROW"
  when "\e[C"
    puts "RIGHT ARROW"
  when "\e[D"
    puts "LEFT ARROW"
  when "\177"
    puts "BACKSPACE"
  when "\004"
    puts "DELETE"
  when "\e[3~"
    puts "ALTERNATE DELETE"
  when "\u0003"
    puts "CONTROL-C"
    exit 0
  when /^.$/
    puts "SINGLE CHAR HIT: #{c.inspect}"
  else
    puts "SOMETHING ELSE: #{c.inspect}"
  end
end
