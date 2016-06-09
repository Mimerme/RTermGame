require './GameObject.rb'
require './keypress.rb'
require 'timeout'
require './RTermGame.rb'

class PlayerObject < GameObject
  def start
    RTermGame.println "Player Initilized"
  end

  def update
    if(Keyboard.get_key_pressed "a")
      if(@x - 1 >= 0)
        @x-=1
      end
    end
    if(Keyboard.get_key_pressed "d")
      if(@x + 1 < @game_world.get_width)
        @x+=1
      end
    end
    if(Keyboard.get_key_pressed "w")
      if(@y - 1 >= 0)
        @y-=1
      end
    end
    if(Keyboard.get_key_pressed "s")
      if(@y + 1 <= @game_world.get_height)
        @y+=1
      end
    end
  end
end
