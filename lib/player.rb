# require_relative 'board'

class Player

# include Board

	def initialize(name)
		@name = name
		@board = Board.new(self)
	end

	def name
		@name
	end

	def has_ships_still_floating?
		@board.ship_count != 0

		# @board.rows.flatten.include?("s")
		# @hit_count = no_of_hits(board)
		# @hit_count < @ships_start

		# @ships == !no_of_hits(board)
	end

	def shoot(at_coordinates, opponent_board)
		opponent_board.register_shot(at_coordinates)
	end

end