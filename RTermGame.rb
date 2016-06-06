#Basic RTermGame functions
require 'io/console'

#The following print functions work around raw mode

#print to console
class RTermGame
  def self.print(text)

    STDOUT.printf text
  end

  def self.println(text)
    whitespace_count = STDOUT.winsize[1] - text.length
    whitespace_string = ""

    for i in 0...whitespace_count
      whitespace_string << " "
    end

    STDOUT.printf (text + whitespace_string)
  end

end
