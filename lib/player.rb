# require 'board'

class Player

	def initialize(name)
		@name = name
		@board = Board.new(name)
		@ships = 10
	end

	def name
		@name
	end

	def ships
		@ships
	end

	def board
		@board
	end

	def has_ships_still_floating?
		@ships == !no_of_hits(board)
	end


	def no_of_hits(board)
		board.hit_count
	end
	

end