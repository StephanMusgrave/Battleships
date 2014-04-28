require_relative 'board'

class Player

# include Board

	def initialize(name)
		@name = name
		@board = Board.new(self)
	end

		attr_reader :name
		attr_reader :board

	def has_ships_still_floating?
		@board.ship_count != 0
	end

	def shoot(at_coordinates, opponent_board)
		opponent_board.register_shot(at_coordinates)
	end

end