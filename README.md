A program to setup a Battleships game
=====================================

Battleships is a game where each player places a number of ships on a board. The board is a 10x10 two dimensional grid.

After the ships have been placed on a players board each player takes turns to shoot on the opponents board. In each round, each player takes a turn to announce a target square in the opponent's grid which is to be shot at. The opponent announces whether or not the square is occupied by a ship, and if it is a "hit" they mark this on their own primary grid. The attacking player notes the hit or miss on their own "tracking" grid, in order to build up a picture of the opponent's fleet.

When all the opponents ships have been hit by the game finishes.

This program sets up a board and a player.  these methods will be used by a game server

Instructions to paly the game on the server:
--------------------------------------------

1. create a directory with missing classes (https://makersacademy.hackpad.com/Teamwork-battleships-zaMgmjFWlQY)
2. sudo ./bin/start.sh ./dir_name
3. It'll bind to battleships.server:8010. Update your /etc/hosts accordingly
4. Once loaded, telnet to it to see if your code works :)

http://github.com/makersacademy/battleships

You need to

gem install eventmachine
gem install terminal-table

follow the readme except don't run sudo