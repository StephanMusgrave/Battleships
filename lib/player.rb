require_relative 'board'

class Player

# include Board

	def initialize(name)
		@name = name
		@board = Board.new(self)
		@ships_start = 10
		@ships = @ships_start
		@hit_count = 0
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
		@board.rows.flatten.include?("s")
		# @hit_count = no_of_hits(board)
		# @hit_count < @ships_start

		# @ships == !no_of_hits(board)
	end

	def no_of_hits(board)
		@hit_count = board.hit_count
	end
	

end