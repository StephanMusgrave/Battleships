require_relative './board.rb'

board ||= Board.new
@board = board

class Player

def initialize(name)
	@name ||= name
end

def board
	@board
end 

def name
	@name
end
	
def has_ships_still_floating?
	board.include? ['s']
end

end