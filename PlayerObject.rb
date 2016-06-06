require './GameObject.rb'
require './keypress.rb'
require 'timeout'
require './RTermGame.rb'

class PlayerObject < GameObject
  def start
    RTermGame.println "Player Initilized"
  end

  def update
    Timeout::timeout(0){
      keke = get_key('a')
    }


    if(keke)
      RTermGame.println "A pressed"
    end
  end

end
