# RTermGame
Create console/terminal games in Ruby. Similar to the Curses library found on linux operating systems. RTerm is a crossplatform variation
that takes its design from popular game engines such as Unity. RTermGame is a simple and easy to use engine that allows for easy modification
with well documented source

RTermGame currently works best with tiled games. There are some plans to extend its capabilities in the future

##RTermGame Lifecycle
- Initialization : Requires a game name, width, and height of the game. Initalizaties a TerminalGame with local variables.

- GameObject / Logic Initalization : This is all done outside of TerminalGame.rb. GameObjects and Logic bits are added to the
game

- Game Loop Begins : The game will not start without calling TerminalGame.rb begin_loop. Begins the infinite loop and starts the
Gameobjects.

- Game Quit : *MUST* be called before ending the game. RTermGame spawns a seperate keyboard listening thread, which must be terminated by calling quit_game in TerminalGame.rb. Alsok resets the terminal back into cooked mode and allows for echoing (things that RTermGame does internally to capture keyboard presses)

