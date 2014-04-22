# include 'board.rb'

class Player

	include Board

	def initialize(name)
		@name = name
		@board = Board.new
	end

	def name
		@name
	end

	def board
		@board
	end
	
	def shoot(at_coordinates, opponent_board)
		opponent_board.register_shots_at(at_coordinates)
	end
	
	def has_ships_still_floating?(board)
		board.hit_count < board.default_lives
	end

end