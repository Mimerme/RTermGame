require './GameObject.rb'
require './keypress.rb'
require 'timeout'

class PlayerObject < GameObject
  def start
    puts "Player Initilized"
  end

  def update
    Timeout::timeout(0){
      keke = get_key('a')
    }


    if(keke)
      puts "A pressed"
    end
  end

end
