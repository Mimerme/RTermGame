#Test file for Ruby concepts

#Lambdas as callbacks
#def call_lambda(&lamb)
#  lamb["test"]
#end

require 'timeout'
require 'io/console'
require 'curses'
require './keypress.rb'
require './RTermGame.rb'


#test_lambda = ->(test_value) {RTermGame.println "Hello #{test_value}"}

#test_lambda["meme"]

#call_lambda(&test_lambda)


#Blocks as callbacks
#def call_block(&block)
#  block["meme"]
#  RTermGame.println "Hello"
#end


#class Test
#  def initialize

#  end
#  def Test_One(lamb)
#    lamb["test"]
#  end
#end

#test_ruby = Test.new
#may = 0
#test_ruby.Test_One(lambda {|x| may = 1})

begin_key_record

loop do
  sleep (0.1)

  if(get_key_pressed "a")
    RTermGame.println "a down"
  end
  #STDIN.cooked!

  reset_key_record

end
