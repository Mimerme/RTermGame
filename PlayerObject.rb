require './GameObject.rb'
require './keypress.rb'
require 'timeout'
require './RTermGame.rb'

class PlayerObject < GameObject
  def start
    RTermGame.println "Player Initilized"
  end

  def update
    RTermGame.println "lmao"

    if(Keyboard.get_key_pressed "a")
      RTermGame.println "a down"
      @sprite="a"
    end
  end

end
