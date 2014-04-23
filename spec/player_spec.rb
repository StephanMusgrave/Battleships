require 'player'

describe Player do
	
	let(:player){Player.new("Steve")}

	it "it should create a new player with a given name" do
		expect(player.name).to eq "Steve"
	end

	# it "can create a board" do
	# 	player = Player.new("Steve")
	# 	# board = double :board

	# 	# expect(board).to receive(:new_board)
	# 	# player.new_board(board)
	# end

	xit "knows whether is has ships floating" do
		expect(player).to have_ships_still_floating
	end

	it "knows how many ships it has" do
		expect(player.ships).to eq 10
	end

	it "gets the number of hits from board" do
		board = double :board
		expect(board).to receive(:hit_count)
		player.no_of_hits(board)
	end

	it "knows when there no ships left" do
		rows = Array.new(10){" "}
		board = double :board, rows: rows
		# puts player.no_of_hits(board)
		expect(player).not_to have_ships_still_floating
	end
	
end

